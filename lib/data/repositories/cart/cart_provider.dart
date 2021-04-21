import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';
import 'package:watumira/data/models/cart.dart';

class CartProvider {
  Future saveCartToStorage({@required List<CartItem> items}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mapItems = [];
    items.forEach((item) {
      mapItems.add({"product": item.product.slug, "quantity": item.quantity});
    });
    var cart = json.encode(mapItems);
    print(cart);
    await prefs.setString('cart', cart);
  }

  Future<List> getCartFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('cart');

    var cartItems = [];

    if (data != null) {
      var rawData = json.decode(data);
      for (dynamic item in rawData) {
        cartItems.add(item);
        // cartItems.add({"product": item["product"], "quantity": item["quantity"]});
      }
    }
    return cartItems;
  }

  Future deleteCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
  }
}
