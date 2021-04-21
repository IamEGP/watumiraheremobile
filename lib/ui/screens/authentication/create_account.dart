import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/authentication/authentication_bloc.dart';
import 'package:watumira/bloc/register_bloc/register_bloc.dart';
import 'package:watumira/data/models/register_user_form.dart';
import 'package:watumira/ui/screens/authentication/login.dart';
import 'package:watumira/ui/screens/authentication/verification.dart';
import 'package:watumira/ui/screens/splash.dart';

class CreateAccountScreen extends StatelessWidget {
  static final String route = 'create_account';
  CreateAccountScreen({Key key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

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
            child: BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterFormState) {
                  _identifierController.text = state.identifier;
                  _passwordController.text = state.password;

                  _identifierController.selection = TextSelection.fromPosition(TextPosition(offset: _identifierController.text.length));
                  _passwordController.selection = TextSelection.fromPosition(TextPosition(offset: _passwordController.text.length));
                }
              },
              builder: (context, state) {
                if (state is RegisterFormState) {
                  return ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: _inputDecoration(
                          hint: 'First Name',
                          icon: Icon(Icons.person),
                        ),
                        onChanged: (e) {
                          BlocProvider.of<RegisterBloc>(context).add(FirstNameInputEvent(value: e));
                        },
                        textCapitalization: TextCapitalization.words,
                        controller: _firstNameController,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: _inputDecoration(
                          hint: 'Last Name',
                          icon: Icon(Icons.person),
                        ),
                        onChanged: (e) {
                          BlocProvider.of<RegisterBloc>(context).add(LastNameInputEvent(value: e));
                        },
                        textCapitalization: TextCapitalization.words,
                        controller: _lastNameController,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        keyboardType: state.isEmail ? TextInputType.emailAddress : TextInputType.phone,
                        decoration: _inputDecoration(
                          hint: state.isEmail ? 'Email' : 'Phone Number',
                          icon: state.isEmail ? Icon(Icons.mail) : Icon(Icons.phone),
                        ),
                        onChanged: (e) {
                          BlocProvider.of<RegisterBloc>(context).add(IdentifierInputEvent(value: e));
                        },
                        controller: _identifierController,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: _inputDecoration(hint: 'Password', icon: Icon(Icons.lock)),
                        obscureText: true,
                        onChanged: (e) {
                          BlocProvider.of<RegisterBloc>(context).add(PasswordInputEvent(value: e));
                        },
                        controller: _passwordController,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: _inputDecoration(hint: 'Repeat Password', icon: Icon(Icons.lock)),
                        obscureText: true,
                        onChanged: (e) {
                          BlocProvider.of<RegisterBloc>(context).add(RepeatPasswordInputEvent(value: e));
                        },
                        controller: _repeatPasswordController,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: state.isEmail,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (bool newValue) {
                              FocusScope.of(context).unfocus();
                              BlocProvider.of<RegisterBloc>(context).add(RegisterAuthTypeChangeEvent());
                            },
                          ),
                          SizedBox(width: 12),
                          InkWell(
                            child: Text(
                              'Sign up with email',
                              style: TextStyle(color: Colors.grey),
                            ),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              BlocProvider.of<RegisterBloc>(context).add(RegisterAuthTypeChangeEvent());
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      BlocConsumer<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          if (state is UserRegisteredState) {
                            Navigator.of(context).pushReplacementNamed(VerificationScreen.route);
                          }

                          if (state is AuthenticationErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                          }
                        },
                        builder: (context, state) {
                          if (state is UserRegisteringState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              if (state is RegisterFormState) {
                                if (state.isValid) {
                                  return TextButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      RegisterFormState data = BlocProvider.of<RegisterBloc>(context).state;
                                      BlocProvider.of<AuthenticationBloc>(context).add(
                                        RegisterUserEvent(
                                          userForm: RegisterUserForm(
                                            firstName: data.firstName,
                                            lastName: data.lastName,
                                            identifier: data.identifier,
                                            isEmail: data.isEmail,
                                            password: data.password,
                                            repeatPassword: data.repeatPassword,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('Sign up'),
                                    style: _loginButtonStyle(context),
                                  );
                                }
                              }
                              return TextButton(
                                onPressed: null,
                                child: Text('Sign up'),
                                style: _loginButtonStyle(context),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(LoginScreen.route);
                        },
                        child: Text('Sign in'),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
