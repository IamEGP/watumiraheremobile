import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/authentication/authentication_bloc.dart';
import 'package:watumira/ui/screens/authentication/verification.dart';
import 'package:watumira/ui/screens/home.dart';
import 'package:watumira/ui/screens/authentication/login.dart';
import 'package:watumira/ui/screens/towns.dart';

class SplashScreen extends StatelessWidget {
  static final String route = 'splash_screen';
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is UserAuthenticatedState) {
          if (state.town != null) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.route);
          } else {
            Navigator.of(context).pushReplacementNamed(ChooseTownScreen.route);
          }
        }
        if (state is UserNotAuthenticatedState || state is AuthenticatingUserState) {
          Navigator.of(context).pushReplacementNamed(LoginScreen.route);
        }
        if (state is UserNotVerifiedState) {
          Navigator.of(context).pushReplacementNamed(VerificationScreen.route);
        }
      },
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 16,
                ),
                Text('Loading App...'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
