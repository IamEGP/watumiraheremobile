import 'package:watumira/data/models/products.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({this.product, this.quantity});

  CartItem copyWith({Product product, int quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
