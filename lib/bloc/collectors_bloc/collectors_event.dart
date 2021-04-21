part of 'collectors_bloc.dart';

abstract class CollectorsEvent extends Equatable {
  const CollectorsEvent();

  @override
  List<Object> get props => [];
}

class GetMyCollectors extends CollectorsEvent {}

class AddCollector extends CollectorsEvent {
  final String name;
  final String phoneNumber;

  AddCollector({@required this.name, @required this.phoneNumber});

  @override
  List<Object> get props => [name, phoneNumber];
}

class DeleteCollector extends CollectorsEvent {
  final String id;
  DeleteCollector({@required this.id});

  @override
  List<Object> get props => [id];
}
