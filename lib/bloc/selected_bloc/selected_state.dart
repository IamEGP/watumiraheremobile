part of 'selected_bloc.dart';

abstract class SelectedState extends Equatable {
  const SelectedState();

  @override
  List<Object> get props => [];
}

class SelectedDataState extends SelectedState {
  final Town town;
  final Product product;
  final Collector collector;
  final CollectionPoint collectionPoint;

  SelectedDataState({this.product, this.town, this.collector, this.collectionPoint});

  SelectedDataState copyWith({
    Town town,
    Product product,
    Collector collector,
    CollectionPoint collectionPoint,
  }) {
    return SelectedDataState(
      town: town ?? this.town,
      product: product ?? this.product,
      collector: collector ?? this.collector,
      collectionPoint: collectionPoint ?? this.collectionPoint,
    );
  }

  @override
  List<Object> get props => [town, product, collector, collectionPoint];
}
