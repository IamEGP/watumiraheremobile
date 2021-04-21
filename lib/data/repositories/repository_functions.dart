import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

class RepositoryFunctions {
  static Future<Map<String, String>> getHeaders({@required FlutterSecureStorage storage}) async {
    var token = await storage.read(key: 'token');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return headers;
  }

  static Future<Map<String, String>> getRefreshTokenHeaders({@required FlutterSecureStorage storage}) async {
    var token = await storage.read(key: 'refreshToken');
    if (token != null) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      return null;
    }
  }
}
