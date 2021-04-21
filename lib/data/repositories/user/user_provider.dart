import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' show Client;
import 'package:watumira/data/repositories/repository_functions.dart';
import 'package:watumira/resources/urls.dart';

class UserProvider {
  final Client client;
  final FlutterSecureStorage storage;

  UserProvider({@required this.client, @required this.storage});

  Future getUserData() async {
    var headers = await RepositoryFunctions.getHeaders(storage: storage);

    var response = await client.get(Uri.parse(Urls.GET_USER), headers: headers);

    if (response.statusCode != 200) {
      print('Getting user failed with status code: ${response.statusCode}');
      throw Exception('An error occured');
    }

    return json.decode(response.body);
  }

  Future getUserCollectors() async {
    var headers = await RepositoryFunctions.getHeaders(storage: storage);
    var response = await client.get(Uri.parse(Urls.COLLECTORS), headers: headers);
    if (response.statusCode != 200) {
      print('Loading collectors failed with status code: ${response.statusCode}');
      throw Exception('An error occured. Try again later.');
    }
    return json.decode(response.body);
  }

  Future addCollector({@required String name, @required String phoneNumber}) async {
    var headers = await RepositoryFunctions.getHeaders(storage: storage);

    var body = {
      "name": name,
      "phoneNumber": phoneNumber,
    };

    var response = await client.post(Uri.parse(Urls.COLLECTORS), headers: headers, body: json.encode(body));
    if (response.statusCode != 200) {
      print('Failed to add collector with status code: ${response.statusCode}');
      throw Exception('An error occured while trying to add a collector. Try again later.');
    }
  }

  Future deleteCollector(String id) async {
    var headers = await RepositoryFunctions.getHeaders(storage: storage);
    var response = await client.delete(Uri.parse('${Urls.COLLECTORS}/$id'), headers: headers);
    if (response.statusCode != 200) {
      print('Failed to delete collector with status code: ${response.statusCode}');
    }
  }
}
