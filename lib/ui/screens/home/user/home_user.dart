import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/authentication/authentication_bloc.dart';
import 'package:watumira/ui/screens/authentication/login.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is UserNotAuthenticatedState) {
              Navigator.of(context).pushReplacementNamed(LoginScreen.route);
            }
          },
          child: TextButton(
            child: Text('Logout'),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LogoutUserEvent());
            },
          ),
        ),
      ),
    );
  }
}
