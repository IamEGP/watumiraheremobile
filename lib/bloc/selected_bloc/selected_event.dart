part of 'selected_bloc.dart';

abstract class SelectedEvent extends Equatable {
  const SelectedEvent();

  @override
  List<Object> get props => [];
}

class SelectTownEvent extends SelectedEvent {
  final Town town;

  SelectTownEvent({this.town});

  @override
  List<Object> get props => [town];
}

class SelectProductEvent extends SelectedEvent {
  final Product product;

  SelectProductEvent({this.product});
  @override
  List<Object> get props => [product];
}

class SelectCollectorEvent extends SelectedEvent {
  final Collector collector;
  SelectCollectorEvent({this.collector});

  @override
  List<Object> get props => [collector];
}

class SelectCollectionPointEvent extends SelectedEvent {
  final CollectionPoint collectionPoint;
  SelectCollectionPointEvent({this.collectionPoint});

  @override
  List<Object> get props => [props];
}
