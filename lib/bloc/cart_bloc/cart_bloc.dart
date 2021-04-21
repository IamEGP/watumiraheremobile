import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:watumira/data/models/cart.dart';
import 'package:watumira/data/models/products.dart';
import 'package:watumira/data/repositories/cart/cart_repository.dart';
import 'package:watumira/data/repositories/products/products_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductsRepository productsRepository;
  final CartRepository cartRepository;
  CartBloc({@required this.productsRepository, @required this.cartRepository}) : super(CartInitialState());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is ClearCart) {
      await cartRepository.deleteCart();
      yield CartInitialState();
    }
    if (event is GetCartFromStorage) {
      var data = await cartRepository.getCartFromStorage();
      List<CartItem> items = [];
      for (var item in data) {
        var product = await productsRepository.getProduct(item["product"]);
        items.add(CartItem(product: product, quantity: item["quantity"]));
      }
      var subTotal = _calculateSubTotal(items);
      var serviceFee = _calculateServiceFee(subTotal);
      var total = _calculateTotalFee(subTotal, serviceFee);

      if (items.isNotEmpty) {
        yield CartLoadedState(
          items: items,
          subTotal: subTotal,
          currency: items[0].product.currency,
          serviceFee: serviceFee,
          total: total,
        );
      }
    }
    if (event is AddItemToCartEvent) {
      var currentState = state;
      if (currentState is CartLoadedState) {
        var items = _addItemsToCart(items: currentState.items, product: event.product);
        var subTotal = _calculateSubTotal(items);
        var serviceFee = _calculateServiceFee(subTotal);
        var total = _calculateTotalFee(subTotal, serviceFee);
        await cartRepository.persistCartToStorage(items);
        yield currentState.copyWith(items: items, subTotal: subTotal, serviceFee: serviceFee, total: total);
      } else {
        var items = [CartItem(product: event.product, quantity: 1)];
        var subTotal = _calculateSubTotal(items);
        var serviceFee = _calculateServiceFee(subTotal);
        var total = _calculateTotalFee(subTotal, serviceFee);
        await cartRepository.persistCartToStorage(items);
        yield CartLoadedState(items: items, subTotal: subTotal, currency: event.product.currency, serviceFee: serviceFee, total: total);
      }
    }

    if (event is SubtractQuantityFromCart) {
      var currentState = state;
      if (currentState is CartLoadedState) {
        var items = currentState.items;
        var newCartItems = <CartItem>[];
        for (var item in items) {
          if (item.product.id == event.product.id) {
            int quantity = item.quantity - 1;
            if (quantity > 0) {
              var newItem = item.copyWith(quantity: quantity);
              newCartItems.add(newItem);
            }
          } else {
            newCartItems.add(item);
          }
        }
        var subTotal = _calculateSubTotal(newCartItems);
        var serviceFee = _calculateServiceFee(subTotal);
        var total = _calculateTotalFee(subTotal, serviceFee);
        await cartRepository.persistCartToStorage(newCartItems);
        yield currentState.copyWith(items: newCartItems, subTotal: subTotal, serviceFee: serviceFee, total: total);
      }
    }

    if (event is RemoveItemFromCartEvent) {
      var currentState = state;
      if (currentState is CartLoadedState) {
        var items = currentState.items;
        var newCartItems = <CartItem>[];
        for (var item in items) {
          if (item.product.id != event.product.id) {
            newCartItems.add(item);
          }
        }
        var subTotal = _calculateSubTotal(newCartItems);
        var serviceFee = _calculateServiceFee(subTotal);
        var total = _calculateTotalFee(subTotal, serviceFee);
        await cartRepository.persistCartToStorage(newCartItems);
        yield currentState.copyWith(items: newCartItems, subTotal: subTotal, serviceFee: serviceFee, total: total);
      }
    }
  }

  List<CartItem> _addItemsToCart({List<CartItem> items, Product product}) {
    var newCartItems = <CartItem>[];
    var availableItems = items.where((e) => e.product.id == product.id);
    if (availableItems.isEmpty) {
      newCartItems.addAll(items);
      newCartItems.add(CartItem(product: product, quantity: 1));
    } else {
      for (var item in items) {
        if (item.product.id == product.id) {
          var newItem = item.copyWith(quantity: item.quantity + 1);
          newCartItems.add(newItem);
        } else {
          newCartItems.add(item);
        }
      }
    }
    return newCartItems;
  }

  double _calculateSubTotal(List<CartItem> items) {
    double total = 0;
    for (CartItem item in items) {
      var itemTotal = item.product.price * item.quantity;
      total += itemTotal;
    }
    return total;
  }

  double _calculateServiceFee(double subTotal) {
    if (subTotal >= 700) return 0.08 * subTotal;
    return 50;
  }

  double _calculateTotalFee(double subTotal, double serviceFee) {
    return subTotal + serviceFee;
  }
}
