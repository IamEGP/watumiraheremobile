part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProductsEvent extends ProductsEvent {
  final String town;
  final String type;
  final int page;
  final int limit;
  final String query;

  FetchProductsEvent({this.town, this.type, this.limit, this.page, this.query});

  @override
  List<Object> get props => [town, type, page, limit, query];
}
