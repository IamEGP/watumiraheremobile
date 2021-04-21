part of 'quantity_bloc.dart';

abstract class QuantityEvent extends Equatable {
  const QuantityEvent();

  @override
  List<Object> get props => [];
}

class AddProductToQuantityEvent extends QuantityEvent {
  final Product product;

  AddProductToQuantityEvent({this.product});

  @override
  List<Object> get props => [product];
}

class AddQuantityEvent extends QuantityEvent {}

class SubtractQuantityEvent extends QuantityEvent {}
