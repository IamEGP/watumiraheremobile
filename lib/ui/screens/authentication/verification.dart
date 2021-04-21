import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/authentication/authentication_bloc.dart';
import 'package:watumira/ui/screens/home.dart';

class VerificationScreen extends StatelessWidget {
  static final String route = 'verification_screen';
  VerificationScreen({Key key}) : super(key: key);

  final TextEditingController _codeController = TextEditingController();

  InputDecoration _inputDecoration({String hint, Icon icon}) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Container(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration(
                    hint: 'Code',
                  ),
                  onChanged: (e) {
                    BlocProvider.of<AuthenticationBloc>(context).add(CodeInputEvent(code: e));
                  },
                  controller: _codeController,
                ),
                SizedBox(height: 16),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is AuthenticationErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                    if (state is VerifyLoadingState) {
                      FocusScope.of(context).unfocus();
                    }

                    if (state is UserAuthenticatedState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed in as ${state.user.firstName} ${state.user.lastName}')));
                      Navigator.of(context).pushReplacementNamed(HomeScreen.route);
                    }
                  },
                  builder: (context, state) {
                    if (state is VerifyLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
