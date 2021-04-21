import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watumira/data/repositories/repository_functions.dart';
import 'package:watumira/resources/urls.dart';

class CheckoutProvider {
  final Client client;
  final FlutterSecureStorage storage;
  CheckoutProvider({@required this.client, @required this.storage});

  Future<String> processCart({@required dynamic items, @required double subTotal, @required double serviceFee, @required double total}) async {
    var rawRequestBody = {
      'items': items,
      'subTotal': subTotal,
      'serviceFee': serviceFee,
      'total': total,
    };
    var body = json.encode(rawRequestBody);
    var headers = await RepositoryFunctions.getHeaders(storage: storage);

    var response = await client.post(Uri.parse(Urls.CART), headers: headers, body: body);
    if (response.statusCode != 200) {
      print('Cart failed to add with status ${response.statusCode}');
      throw Exception('An error occured. Try again later.');
    }

    var data = json.decode(response.body);
    return data['_id'];
  }

  Future placeOrder({@required String cartId, @required String collectorId, @required String collectionPointId}) async {
    var headers = await RepositoryFunctions.getHeaders(storage: storage);
    var body = {
      "cart": cartId,
      "collector": collectorId,
      "collectionPoint": collectionPointId,
    };

    var response = await client.post(Uri.parse(Urls.ORDERS), body: json.encode(body), headers: headers);

    if (response.statusCode != 200) {
      print('Order failed with a status code of ${response.statusCode}');
      throw Exception('An error occured. Try again later.');
    }

    return json.decode(response.body);
  }
}
