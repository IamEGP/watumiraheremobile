import 'package:watumira/data/models/collectors.dart';
import 'package:watumira/data/models/user.dart';
import 'package:watumira/data/repositories/user/user_provider.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final UserProvider provider;

  UserRepository({@required this.provider});

  Future<User> getUser() async {
    var data = await provider.getUserData();
    return User.fromJson(data);
  }

  Future<List<Collector>> getCollectors() async {
    var data = await provider.getUserCollectors();
    return Collectors.fromJson(data).collectors;
  }

  Future addCollector({@required String name, @required String phoneNumber}) async {
    await provider.addCollector(name: name, phoneNumber: phoneNumber);
  }

  Future deleteCollector(String id) async {
    await provider.deleteCollector(id);
  }
}
