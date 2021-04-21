import 'package:meta/meta.dart';
import 'package:watumira/data/models/cart.dart';
import 'package:watumira/data/repositories/cart/cart_provider.dart';

class CartRepository {
  final CartProvider provider;
  CartRepository({@required this.provider});

  Future persistCartToStorage(List<CartItem> items) async {
    await provider.saveCartToStorage(items: items);
  }

  Future<List> getCartFromStorage() async {
    return await provider.getCartFromStorage();
  }

  Future deleteCart() async {
    await provider.deleteCart();
  }
}
