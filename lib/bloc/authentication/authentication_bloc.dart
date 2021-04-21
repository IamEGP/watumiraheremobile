import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:watumira/bloc/bloc_functions.dart';
import 'package:watumira/bloc/collectors_bloc/collectors_bloc.dart';
import 'package:watumira/data/models/collectors.dart';
import 'package:watumira/data/models/register_user_form.dart';
import 'package:watumira/data/models/towns.dart';
import 'package:watumira/data/models/user.dart';
import 'package:watumira/data/repositories/authentication/authentication_repository.dart';
import 'package:watumira/data/repositories/towns/towns_repository.dart';
import 'package:watumira/data/repositories/user/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final TownsRepository townsRepository;
  final CollectorsBloc collectorsBloc;

  AuthenticationBloc({
    @required this.authenticationRepository,
    @required this.userRepository,
    @required this.townsRepository,
    @required this.collectorsBloc,
  }) : super(AuthenticationInitial()) {
    authenticationRepository.status.listen((data) {
      if (data is Authenticated) {
        add(GetUserEvent());
      } else if (data is UnAuthenticated) {
        add(UnAuthenticateUserEvent());
      }
    });
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticateUserEvent) {
      try {
        await authenticationRepository.checkAuth();
      } catch (e) {
        print(e);
        var message = BlocFunctions.getErrorMessage(e);
        yield AuthenticationErrorState(message: message);
      }
    }

    if (event is LoginUserEvent) {
      yield AuthenticatingUserState();
      try {
        await authenticationRepository.loginUser(
          identifier: event.identifier,
          password: event.password,
        );
      } catch (e) {
        print(e);
        var message = BlocFunctions.getErrorMessage(e);
        yield AuthenticationErrorState(message: message);
      }
    }

    if (event is GetUserEvent) {
      try {
        var user = await userRepository.getUser();
        if (user.isVerified) {
          collectorsBloc.add(GetMyCollectors());
          var town = await townsRepository.getUserTown();
          yield UserAuthenticatedState(user: user, town: town);
        } else {
          yield UserNotVerifiedState();
        }
      } catch (e) {
        var message = BlocFunctions.getErrorMessage(e);
        yield AuthenticationErrorState(message: message);
      }
    }

    if (event is LogoutUserEvent) {
      try {
        await authenticationRepository.logOut();
      } catch (e) {
        var message = BlocFunctions.getErrorMessage(e);
        yield AuthenticationErrorState(message: message);
      }
    }

    if (event is UnAuthenticateUserEvent) {
      yield UserNotAuthenticatedState();
    }

    if (event is RegisterUserEvent) {
      try {
        yield UserRegisteringState();
        await authenticationRepository.registerUser(userForm: event.userForm);
        yield UserRegisteredState();
      } catch (e) {
        var message = BlocFunctions.getErrorMessage(e);
        yield AuthenticationErrorState(message: message);
      }
    }

    if (event is CodeInputEvent) {
      if (event.code.length == 6) {
        yield VerifyLoadingState();
        try {
          await authenticationRepository.verifyUser(code: event.code);
          await authenticationRepository.autoLoginUser();
        } catch (e) {
          var message = BlocFunctions.getErrorMessage(e);
          yield AuthenticationErrorState(message: message);
        }
      }
    }
  }
}
