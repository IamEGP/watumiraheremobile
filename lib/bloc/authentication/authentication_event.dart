part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateUserEvent extends AuthenticationEvent {}

class LoginUserEvent extends AuthenticationEvent {
  final String identifier;
  final String password;

  LoginUserEvent({
    @required this.identifier,
    @required this.password,
  });

  @override
  List<Object> get props => [identifier, password];
}

class RegisterUserEvent extends AuthenticationEvent {
  final RegisterUserForm userForm;

  RegisterUserEvent({@required this.userForm});

  @override
  List<Object> get props => [userForm];
}

class CodeInputEvent extends AuthenticationEvent {
  final String code;

  CodeInputEvent({@required this.code});

  @override
  List<Object> get props => [code];
}

class GetUserEvent extends AuthenticationEvent {}

class LogoutUserEvent extends AuthenticationEvent {}

class UnAuthenticateUserEvent extends AuthenticationEvent {}
