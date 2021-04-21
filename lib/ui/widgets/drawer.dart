import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/authentication/authentication_bloc.dart';
import 'package:watumira/ui/screens/authentication/login.dart';
import 'package:watumira/ui/screens/collectors/collectors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is UserAuthenticatedState) {
                return UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: Text('${state.user.firstName.substring(0, 1)}${state.user.lastName.substring(0, 1)}'),
                    backgroundColor: Colors.white,
                  ),
                  accountName: Text('${state.user.firstName} ${state.user.lastName}'),
                  accountEmail: Text(state.user.identifier),
                );
              }
              return Container();
            },
          ),
          ListTile(
            title: Text('Collectors'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(CollectorsScreen.route);
            },
            leading: Icon(Icons.people),
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.power_settings_new),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LogoutUserEvent());
              Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.route, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
