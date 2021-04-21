import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/authentication/authentication_bloc.dart';
import 'package:watumira/bloc/login_bloc/login_bloc.dart';
import 'package:watumira/ui/screens/authentication/create_account.dart';
import 'package:watumira/ui/screens/home.dart';

class LoginScreen extends StatelessWidget {
  static final String route = 'login_screen';
  LoginScreen({Key key}) : super(key: key);

  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  ButtonStyle _loginButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      primary: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 16,
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
              child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginFormState) {
                _identifierController.text = state.identifier;
                _passwordController.text = state.password;

                _identifierController.selection = TextSelection.fromPosition(TextPosition(offset: _identifierController.text.length));
                _passwordController.selection = TextSelection.fromPosition(TextPosition(offset: _passwordController.text.length));
              }
            },
            builder: (context, state) {
              if (state is LoginFormState) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      keyboardType: state.isEmail ? TextInputType.emailAddress : TextInputType.phone,
                      decoration: _inputDecoration(
                        hint: state.isEmail ? 'Email' : 'Phone Number',
                        icon: state.isEmail ? Icon(Icons.mail) : Icon(Icons.phone),
                      ),
                      onChanged: (e) {
                        BlocProvider.of<LoginBloc>(context).add(IdentifierInputEvent(text: e));
                      },
                      controller: _identifierController,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: _inputDecoration(hint: 'Password', icon: Icon(Icons.lock)),
                      obscureText: true,
                      onChanged: (e) {
                        BlocProvider.of<LoginBloc>(context).add(PasswordInputEvent(text: e));
                      },
                      controller: _passwordController,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: state.isEmail,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (bool newValue) {
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<LoginBloc>(context).add(AuthTypeChangeEvent());
                          },
                        ),
                        SizedBox(width: 12),
                        InkWell(
                          child: Text(
                            'Sign in with email',
                            style: TextStyle(color: Colors.grey),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<LoginBloc>(context).add(AuthTypeChangeEvent());
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    BlocConsumer<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        if (state is UserAuthenticatedState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Signed in as ${state.user.firstName} ${state.user.lastName}.',
                              ),
                            ),
                          );
                          Navigator.of(context).pushReplacementNamed(HomeScreen.route);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthenticatingUserState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is LoginFormState) {
                              if (state.identifier.isNotEmpty && state.password.isNotEmpty) {
                                return TextButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    LoginFormState data = BlocProvider.of<LoginBloc>(context).state;
                                    BlocProvider.of<AuthenticationBloc>(context).add(
                                      LoginUserEvent(
                                        identifier: data.identifier,
                                        password: data.password,
                                      ),
                                    );
                                  },
                                  child: Text('Sign in'),
                                  style: _loginButtonStyle(context),
                                );
                              }
                            }
                            return TextButton(
                              onPressed: null,
                              child: Text('Sign in'),
                              style: _loginButtonStyle(context),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(CreateAccountScreen.route);
                      },
                      child: Text('Create Account'),
                    ),
                  ],
                );
              }
              return Container();
            },
          )),
        ],
      ),
    );
  }
}
