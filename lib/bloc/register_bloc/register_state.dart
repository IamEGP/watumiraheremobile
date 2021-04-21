part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterFormState extends RegisterState {
  final String firstName;
  final String lastName;
  final String identifier;
  final String password;
  final String repeatPassword;
  final bool isEmail;

  bool get isValid {
    return this.firstName.isNotEmpty && this.lastName.isNotEmpty && this.identifier.isNotEmpty && this.password.isNotEmpty && this.repeatPassword.isNotEmpty;
  }

  RegisterFormState({
    this.firstName,
    this.identifier,
    this.isEmail,
    this.lastName,
    this.password,
    this.repeatPassword,
  });

  RegisterFormState copyWith({
    String firstName,
    String lastName,
    String identifier,
    String password,
    String repeatPassword,
    bool isEmail,
  }) {
    return RegisterFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      isEmail: isEmail ?? this.isEmail,
      repeatPassword: repeatPassword ?? this.repeatPassword,
    );
  }

  @override
  List<Object> get props => [firstName, lastName, identifier, password, isEmail, repeatPassword];
}
