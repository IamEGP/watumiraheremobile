import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watumira/data/repositories/authentication/authentication_provider.dart';
import 'package:watumira/data/repositories/authentication/authentication_repository.dart';
import 'package:watumira/data/repositories/cart/cart_provider.dart';
import 'package:watumira/data/repositories/cart/cart_repository.dart';
import 'package:watumira/data/repositories/checkout/checkout_provider.dart';
import 'package:watumira/data/repositories/checkout/checkout_repository.dart';
import 'package:watumira/data/repositories/products/products_provider.dart';
import 'package:watumira/data/repositories/products/products_repository.dart';
import 'package:watumira/data/repositories/towns/towns_provider.dart';
import 'package:watumira/data/repositories/towns/towns_repository.dart';
import 'package:watumira/data/repositories/user/user_provider.dart';
import 'package:watumira/data/repositories/user/user_repository.dart';
import 'package:http/http.dart' show Client;

class AppRepositories extends StatelessWidget {
  final Widget appBlocs;
  final FlutterSecureStorage storage;
  final Client client;
  const AppRepositories({
    Key key,
    @required this.appBlocs,
    @required this.client,
    @required this.storage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthenticationRepository(
            provider: AuthenticationProvider(
              client: client,
              storage: storage,
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(
            provider: UserProvider(
              client: client,
              storage: storage,
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => TownsRepository(
            provider: TownsProvider(client: client, storage: storage),
          ),
        ),
        RepositoryProvider(
          create: (context) => ProductsRepository(
            provider: ProductsProvider(
              client: client,
              storage: storage,
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => CartRepository(
            provider: CartProvider(),
          ),
        ),
        RepositoryProvider(
          create: (context) => CheckoutRepository(
            provider: CheckoutProvider(
              client: client,
              storage: storage,
            ),
          ),
        ),
      ],
      child: appBlocs,
    );
  }
}
