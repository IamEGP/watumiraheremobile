import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' show Client;
import 'package:watumira/data/repositories/repository_functions.dart';
import 'package:watumira/resources/urls.dart';

class ProductsProvider {
  final FlutterSecureStorage storage;
  final Client client;

  ProductsProvider({@required this.client, @required this.storage});

  Future getProducts({
    String type = 'single-products',
    String town,
    int page = 1,
    int limit = 20,
    String query,
  }) async {
    var headers = await RepositoryFunctions.getHeaders(storage: storage);
    var queryString = _generateProductsQueryParameters(
      page: page,
      limit: limit,
      town: town,
      type: type,
      query: query,
    );
    var response = await client.get(Uri.parse('${Urls.PRODUCTS}$queryString'), headers: headers);

    if (response.statusCode != 200) {
      print('Products fetch failed with status code: ${response.statusCode}');
      throw Exception('There was an error fetching products. Try again later.');
    }

    return json.decode(response.body);
  }

  Future getProduct(String slug) async {
    var headers = await RepositoryFunctions.getHeaders(storage: storage);
    var response = await client.get(Uri.parse('${Urls.PRODUCTS}/$slug'), headers: headers);
    if (response.statusCode != 200) {
      print('Failed to load product status code: ${response.statusCode}');
      throw Exception('There was an error loading product');
    }
    return json.decode(response.body);
  }

  static _generateProductsQueryParameters({String query, int page, int limit, String town, String type}) {
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

    if (town != null) {
      queryParams['town'] = town;
    }

    if (type != null) {
      queryParams['type'] = type;
    }
    String queryString = Uri(queryParameters: queryParams).query;

    queryString = queryString.isEmpty ? '' : '?$queryString';
    return queryString;
  }
}
