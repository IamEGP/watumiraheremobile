import 'package:watumira/data/models/towns.dart';
import 'package:meta/meta.dart';
import 'package:watumira/data/repositories/towns/towns_provider.dart';

class TownsRepository {
  final TownsProvider provider;

  TownsRepository({@required this.provider});

  Future<Towns> getTowns({int page, int limit, String query}) async {
    var data = await provider.getTownsData(page: page, limit: limit, query: query);
    return Towns.fromJson(data);
  }

  Future saveUserTown({String slug}) async {
    await provider.saveUserTown(slug: slug);
  }

  Future<Town> getUserTown() async {
    var data = await provider.getUserTown();
    if (data == null) {
      return null;
    }
    return Town.fromJson(data);
  }
}
