import 'dart:async';

import 'package:meta/meta.dart';
import 'package:watumira/data/models/register_user_form.dart';
import 'package:watumira/data/repositories/authentication/authentication_provider.dart';

abstract class AuthenticationStatus {}

class Authenticated extends AuthenticationStatus {}

class UnAuthenticated extends AuthenticationStatus {}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final _tokenController = StreamController<String>();

  final AuthenticationProvider provider;

  AuthenticationRepository({@required this.provider});

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _controller.stream;
  }

  Stream<String> get token async* {
    yield '';
    yield* _tokenController.stream;
  }

  Future<void> checkAuth() async {
    try {
      var token = await provider.getAuthenticationToken();

      if (token != null) {
        _controller.add(Authenticated());
      } else {
        _controller.add(UnAuthenticated());
      }
    } catch (e) {
      _controller.add(UnAuthenticated());
    }
  }

  Future<void> loginUser({String identifier, String password}) async {
    try {
      var user = await provider.loginUser(
        identifier: identifier,
        password: password,
      );
      await provider.saveRefreshTokenInStorage(user);
      await provider.getAuthenticationToken();
      _controller.add(Authenticated());
    } catch (e) {
      print(e);
      print(e.message);
    }
  }

  Future autoLoginUser() async {
    try {
      var user = await provider.autoLoginUser();
      await provider.saveRefreshTokenInStorage(user);
      await provider.getAuthenticationToken();
      _controller.add(Authenticated());
    } catch (e) {
      print(e);
      print(e.message);
    }
  }

  Future registerUser({RegisterUserForm userForm}) async {
    await provider.registerUser(userForm);
  }

  Future verifyUser({String code}) async {
    await provider.verifyUser(code: code);
  }

  Future logOut() async {
    await provider.logoutUser();
    _controller.add(UnAuthenticated());
  }

  void dispose() {
    _controller.close();
    _tokenController.close();
  }
}
