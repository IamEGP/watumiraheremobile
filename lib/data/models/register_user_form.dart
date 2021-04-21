import 'package:meta/meta.dart';

class RegisterUserForm {
  final String firstName;
  final String lastName;
  final String identifier;
  final String password;
  final String repeatPassword;
  final bool isEmail;

  RegisterUserForm({
    @required this.firstName,
    @required this.identifier,
    @required this.isEmail,
    @required this.lastName,
    @required this.password,
    @required this.repeatPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      this.isEmail ? 'email' : 'phone': this.identifier,
      'password': this.password,
      'repeatPassword': this.repeatPassword,
      'authType': this.isEmail ? 'email' : 'phone',
    };
  }
}
