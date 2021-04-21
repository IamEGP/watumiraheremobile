part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class FirstNameInputEvent extends RegisterEvent {
  final String value;

  FirstNameInputEvent({this.value});

  @override
  List<Object> get props => [value];
}

class LastNameInputEvent extends RegisterEvent {
  final String value;

  LastNameInputEvent({this.value});

  @override
  List<Object> get props => [value];
}

class IdentifierInputEvent extends RegisterEvent {
  final String value;

  IdentifierInputEvent({this.value});

  @override
  List<Object> get props => [value];
}

class PasswordInputEvent extends RegisterEvent {
  final String value;

  PasswordInputEvent({this.value});

  @override
  List<Object> get props => [value];
}

class RepeatPasswordInputEvent extends RegisterEvent {
  final String value;

  RepeatPasswordInputEvent({this.value});

  @override
  List<Object> get props => [value];
}

class RegisterAuthTypeChangeEvent extends RegisterEvent {}
