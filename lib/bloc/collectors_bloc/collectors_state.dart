part of 'collectors_bloc.dart';

abstract class CollectorsState extends Equatable {
  const CollectorsState();

  @override
  List<Object> get props => [];
}

class CollectorsInitial extends CollectorsState {}

class CollectorsLoadedState extends CollectorsState {
  final List<Collector> collectors;
  CollectorsLoadedState({@required this.collectors});

  @override
  List<Object> get props => [collectors];
}

class CollectorsErrorState extends CollectorsState {
  final String message;
  CollectorsErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
