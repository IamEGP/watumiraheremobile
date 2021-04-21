part of 'quantity_bloc.dart';

abstract class QuantityState extends Equatable {
  const QuantityState();

  @override
  List<Object> get props => [];
}

class QuantityInitial extends QuantityState {}

class ProductQuantityState extends QuantityState {
  final Product product;
  final int quantity;

  ProductQuantityState({this.product, this.quantity});

  ProductQuantityState copyWith({Product product, int quantity}) {
    return ProductQuantityState(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [product, quantity];
}
