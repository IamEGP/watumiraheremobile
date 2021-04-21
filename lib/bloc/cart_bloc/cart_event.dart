part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartFromStorage extends CartEvent {}

class ClearCart extends CartEvent {}

class AddItemToCartEvent extends CartEvent {
  final Product product;

  AddItemToCartEvent({this.product});

  @override
  List<Object> get props => [product];
}

class RemoveItemFromCartEvent extends CartEvent {
  final Product product;
  RemoveItemFromCartEvent({this.product});

  @override
  List<Object> get props => [product];
}

class SubtractQuantityFromCart extends CartEvent {
  final Product product;

  SubtractQuantityFromCart({this.product});

  @override
  List<Object> get props => [product];
}
