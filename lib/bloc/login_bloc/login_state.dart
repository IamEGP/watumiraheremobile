part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginFormState extends LoginState {
  final String identifier;
  final String password;
  final bool isEmail;

  LoginFormState({this.identifier, this.password, this.isEmail});

  LoginFormState copyWith({String identifier, String password, bool isEmail}) {
    return LoginFormState(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      isEmail: isEmail ?? this.isEmail,
    );
  }

  @override
  List<Object> get props => [identifier, password, isEmail];
}
