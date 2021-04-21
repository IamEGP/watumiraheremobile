import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/add_collector_bloc/add_collector_bloc.dart';
import 'package:watumira/bloc/authentication/authentication_bloc.dart';
import 'package:watumira/bloc/cart_bloc/cart_bloc.dart';
import 'package:watumira/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:watumira/bloc/collectors_bloc/collectors_bloc.dart';
import 'package:watumira/bloc/home_selected_bloc/home_selected_tab_bloc.dart';
import 'package:watumira/bloc/login_bloc/login_bloc.dart';
import 'package:watumira/bloc/products_bloc/products_bloc.dart';
import 'package:watumira/bloc/quantity_bloc/quantity_bloc.dart';
import 'package:watumira/bloc/register_bloc/register_bloc.dart';
import 'package:watumira/bloc/selected_bloc/selected_bloc.dart';
import 'package:watumira/bloc/towns/towns_bloc.dart';
import 'package:watumira/data/repositories/authentication/authentication_repository.dart';
import 'package:watumira/data/repositories/cart/cart_repository.dart';
import 'package:watumira/data/repositories/checkout/checkout_repository.dart';
import 'package:watumira/data/repositories/products/products_repository.dart';
import 'package:watumira/data/repositories/towns/towns_repository.dart';
import 'package:watumira/data/repositories/user/user_repository.dart';

class AppBlocs extends StatelessWidget {
  final Widget child;
  const AppBlocs({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CollectorsBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
            userRepository: RepositoryProvider.of<UserRepository>(context),
            townsRepository: RepositoryProvider.of<TownsRepository>(context),
            collectorsBloc: BlocProvider.of<CollectorsBloc>(context),
          )..add(AuthenticateUserEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ProductsBloc(
            productsRepository: RepositoryProvider.of<ProductsRepository>(context),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => TownsBloc(
            townsRepository: RepositoryProvider.of<TownsRepository>(context),
            productsBloc: BlocProvider.of<ProductsBloc>(context),
          )..add(LoadTownsEvent(limit: 100)),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SelectedBloc(),
          lazy: false,
        ),
        BlocProvider(create: (context) => QuantityBloc()),
        BlocProvider(create: (context) => HomeSelectedTabBloc()),
        BlocProvider(create: (context) => LoginBloc(), lazy: false),
        BlocProvider(create: (context) => RegisterBloc(), lazy: false),
        BlocProvider(
          create: (context) => CartBloc(
            cartRepository: RepositoryProvider.of<CartRepository>(context),
            productsRepository: RepositoryProvider.of<ProductsRepository>(context),
          )..add(GetCartFromStorage()),
          lazy: false,
        ),
        BlocProvider(create: (context) => AddCollectorBloc()),
        BlocProvider(
          create: (context) => CheckoutBloc(
            repository: RepositoryProvider.of<CheckoutRepository>(context),
            cartBloc: BlocProvider.of<CartBloc>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}
