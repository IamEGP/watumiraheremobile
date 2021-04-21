part of 'add_collector_bloc.dart';

abstract class AddCollectorState extends Equatable {
  const AddCollectorState();

  @override
  List<Object> get props => [];
}

class AddCollectorFormData extends AddCollectorState {
  final String name;
  final String phoneNumber;

  AddCollectorFormData({@required this.name, @required this.phoneNumber});

  AddCollectorFormData copyWith({String name, String phoneNumber}) {
    return AddCollectorFormData(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [name, phoneNumber];
}
