import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' show Client;
import 'package:watumira/data/repositories/repository_functions.dart';
import 'package:watumira/resources/urls.dart';

class TownsProvider {
  final Client client;
  final FlutterSecureStorage storage;

  TownsProvider({@required this.client, @required this.storage});

  Future getTownsData({int page, int limit, String query}) async {
    var headers = await RepositoryFunctions.getHeaders(storage: storage);
    var queryString = _generateTownsQueryParameters(page: page, limit: limit, query: query);
    var response = await client.get(
      Uri.parse('${Urls.TOWNS}$queryString'),
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw Exception('An error occured');
    }

    return json.decode(response.body);
  }

  Future getUserTown() async {
    var slug = await storage.read(key: 'townSlug');

    if (slug == null) {
      return null;
    }

    var response = await client.get(Uri.parse('${Urls.TOWN}/$slug'));

    if (response.statusCode != 200) {
      print(response.body);
      throw Exception('An error occured while loading town');
    }

    return json.decode(response.body);
  }

  Future saveUserTown({String slug}) async {
    await storage.write(key: 'townSlug', value: slug);
  }

  static _generateTownsQueryParameters({String query, int page, int limit}) {
    Map<String, String> queryParams = {};
    if (page != null) {
      queryParams['page'] = '$page';
    }

    if (limit != null) {
      queryParams['limit'] = '$limit';
    }

    if (query != null) {
      queryParams['query'] = query;
    }
    String queryString = Uri(queryParameters: queryParams).query;

    queryString = queryString.isEmpty ? '' : '?$queryString';
    return queryString;
  }
}
