part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class IdentifierInputEvent extends LoginEvent {
  final String text;
  IdentifierInputEvent({@required this.text});

  @override
  List<Object> get props => [text];
}

class PasswordInputEvent extends LoginEvent {
  final String text;
  PasswordInputEvent({@required this.text});

  @override
  List<Object> get props => [text];
}

class AuthTypeChangeEvent extends LoginEvent {}
