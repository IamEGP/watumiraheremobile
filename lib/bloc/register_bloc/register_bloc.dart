import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(
          RegisterFormState(
            firstName: '',
            lastName: '',
            identifier: '',
            isEmail: false,
            password: '',
            repeatPassword: '',
          ),
        );

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is FirstNameInputEvent) {
      var currentState = state;
      if (currentState is RegisterFormState) {
        yield currentState.copyWith(firstName: event.value);
      }
    }

    if (event is LastNameInputEvent) {
      var currentState = state;
      if (currentState is RegisterFormState) {
        yield currentState.copyWith(lastName: event.value);
      }
    }

    if (event is IdentifierInputEvent) {
      var currentState = state;
      if (currentState is RegisterFormState) {
        yield currentState.copyWith(identifier: event.value);
      }
    }

    if (event is PasswordInputEvent) {
      var currentState = state;
      if (currentState is RegisterFormState) {
        yield currentState.copyWith(password: event.value);
      }
    }

    if (event is RepeatPasswordInputEvent) {
      var currentState = state;
      if (currentState is RegisterFormState) {
        yield currentState.copyWith(repeatPassword: event.value);
      }
    }

    if (event is RegisterAuthTypeChangeEvent) {
      var currentState = state;
      if (currentState is RegisterFormState) {
        yield currentState.copyWith(isEmail: !currentState.isEmail, identifier: '');
      }
    }
  }
}
