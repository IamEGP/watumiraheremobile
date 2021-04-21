part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final Products products;

  ProductsLoadedState({@required this.products});

  @override
  List<Object> get props => [products];
}

class ProductsLoadingErrorState extends ProductsState {
  final String message;

  ProductsLoadingErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
