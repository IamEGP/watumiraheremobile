import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watumira/data/models/error.dart';
import 'package:watumira/data/models/register_user_form.dart';
import 'package:watumira/data/models/user.dart';
import 'package:watumira/data/repositories/repository_functions.dart';
import 'package:watumira/resources/urls.dart';

class AuthenticationProvider {
  final FlutterSecureStorage storage;
  final Client client;

  AuthenticationProvider({@required this.client, @required this.storage});

  // Login in user from the auth service
  Future<User> loginUser({String identifier, String password}) async {
    var response = await client.post(
      Uri.parse(Urls.LOGIN),
      body: {
        'identifier': identifier,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('An error occured with status: ${response.statusCode}');
    }

    var body = json.decode(response.body);
    return User.fromJson(body);
  }

  // static Future<String> get

  Future<User> autoLoginUser() async {
    // +263715796894
    var body = await _getUserLoginDetails();
    var response = await client.post(Uri.parse(Urls.LOGIN), body: body);

    if (response.statusCode != 200) {
      throw Exception('An error occured with status: ${response.statusCode}');
    }

    var data = json.decode(response.body);
    return User.fromJson(data);
  }

  Future registerUser(RegisterUserForm userForm) async {
    var response = await client.post(
      Uri.parse(Urls.REGISTER_USER),
      body: userForm.toJson(),
    );

    if (response.statusCode != 200) {
      print(response.statusCode);
      var errorData = json.decode(response.body);
      var errors = errorFromJson(errorData['errors']);
      throw Exception(errors[0].message);
    }
    _saveUserIdentifier(
      identifier: userForm.identifier,
      password: userForm.password,
    );
  }

  Future verifyUser({String code}) async {
    var body = await _userVerifyRequestBody(code: code);
    var response = await client.post(Uri.parse(Urls.VERIFY_USER), body: body);

    if (response.statusCode != 200) {
      print(response.statusCode);
      var errorData = json.decode(response.body);
      var errors = errorFromJson(errorData['errors']);
      throw Exception(errors[0].message);
    }
  }

  // Saving user token in storage
  Future<void> saveRefreshTokenInStorage(User user) async {
    await storage.write(
      key: 'refreshToken',
      value: user.refreshToken,
    );
  }

  // Getting authentication token
  Future getAuthenticationToken() async {
    var headers = await RepositoryFunctions.getRefreshTokenHeaders(storage: storage);

    if (headers == null) {
      return null;
    }
    var response = await client.post(Uri.parse(Urls.REFRESH_TOKEN), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('An error occured with status: ${response.statusCode}');
    }
    var jsonData = json.decode(response.body);
    _persistUserToken(jsonData['token']);
    return jsonData['token'];
  }

  Future logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
    await storage.deleteAll();
  }

  // Helper functions

  _persistUserToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  // Save user identifier for verification
  Future _saveUserIdentifier({String identifier, String password}) async {
    await storage.write(key: 'identifier', value: identifier);
    await storage.write(key: 'password', value: password);
  }

  Future _getUserLoginDetails() async {
    var identifier = await storage.read(key: 'identifier');
    var password = await storage.read(key: 'password');

    return {
      'identifier': identifier,
      'password': password,
    };
  }

  Future _userVerifyRequestBody({String code}) async {
    var identifier = await storage.read(key: 'identifier');
    print(identifier);
    return {
      'identifier': identifier,
      'code': code,
    };
  }
}
