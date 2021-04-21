import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watumira/bloc/bloc_functions.dart';
import 'package:watumira/data/models/products.dart';
import 'package:meta/meta.dart';
import 'package:watumira/data/repositories/products/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;
  ProductsBloc({@required this.productsRepository}) : super(ProductsInitial());

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is FetchProductsEvent) {
      try {
        yield ProductsLoadingState();
        var products = await productsRepository.getProducts(
          limit: event.limit,
          page: event.page,
          query: event.query,
          town: event.town,
          type: event.type,
        );
        yield ProductsLoadedState(products: products);
      } catch (e) {
        var message = BlocFunctions.getErrorMessage(e);
        yield ProductsLoadingErrorState(message: message);
      }
    }
  }
}
