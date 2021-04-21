part of 'add_collector_bloc.dart';

abstract class AddCollectorEvent extends Equatable {
  const AddCollectorEvent();

  @override
  List<Object> get props => [];
}

class AddCollectorName extends AddCollectorEvent {
  final String name;
  AddCollectorName({@required this.name});

  @override
  List<Object> get props => [name];
}

class AddCollectorPhoneNumber extends AddCollectorEvent {
  final String phoneNumber;
  AddCollectorPhoneNumber({@required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}
