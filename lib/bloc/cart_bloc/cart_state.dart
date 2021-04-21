part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitialState extends CartState {}

class CartLoadedState extends CartState {
  final List<CartItem> items;
  int get count => items.length;
  final double total;
  final double subTotal;
  final double serviceFee;
  final Currency currency;
  CartLoadedState({this.items, this.subTotal, this.total, this.currency, this.serviceFee});

  CartLoadedState copyWith({List<CartItem> items, double total, double subTotal, double serviceFee}) {
    return CartLoadedState(
      items: items ?? this.items,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      currency: this.currency,
      serviceFee: serviceFee ?? this.serviceFee,
    );
  }

  @override
  List<Object> get props => [items, count, subTotal, total, serviceFee, currency];
}
