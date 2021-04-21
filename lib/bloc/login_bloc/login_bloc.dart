import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(
          LoginFormState(
            identifier: '',
            password: '',
            isEmail: false,
          ),
        );

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is IdentifierInputEvent) {
      var currentState = state;
      if (currentState is LoginFormState) {
        yield currentState.copyWith(identifier: event.text);
      }
    }

    if (event is PasswordInputEvent) {
      var currentState = state;
      if (currentState is LoginFormState) {
        yield currentState.copyWith(password: event.text);
      }
    }

    if (event is AuthTypeChangeEvent) {
      var currentState = state;
      if (currentState is LoginFormState) {
        yield currentState.copyWith(isEmail: !currentState.isEmail, identifier: '');
      }
    }
  }
}
