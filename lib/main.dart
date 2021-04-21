import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' show Client;
import 'package:watumira/app_blocs.dart';
import 'package:watumira/app_repositories.dart';
import 'package:watumira/bloc/bloc_delegate.dart';
import 'package:watumira/data/models/towns.dart';
import 'package:watumira/ui/resources/colors.dart';
import 'package:watumira/ui/screens/authentication/create_account.dart';
import 'package:watumira/ui/screens/authentication/login.dart';
import 'package:watumira/ui/screens/authentication/verification.dart';
import 'package:watumira/ui/screens/cart.dart';
import 'package:watumira/ui/screens/checkout.dart';
import 'package:watumira/ui/screens/collection_points.dart';
import 'package:watumira/ui/screens/collectors/add_collector.dart';
import 'package:watumira/ui/screens/collectors/collectors.dart';
import 'package:watumira/ui/screens/home.dart';
import 'package:watumira/ui/screens/product.dart';
import 'package:watumira/ui/screens/products.dart';
import 'package:watumira/ui/screens/splash.dart';
import 'package:watumira/ui/screens/successful_screen.dart';
import 'package:watumira/ui/screens/towns.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocDelegate();
  FlutterSecureStorage storage = FlutterSecureStorage();
  Client client = Client();

  runApp(
    AppRepositories(
      appBlocs: AppBlocs(
        child: MainApp(),
      ),
      client: client,
      storage: storage,
    ),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WatumiraHere',
      theme: ThemeData(
        primarySwatch: CompanyColors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
      routes: {
        SplashScreen.route: (context) => SplashScreen(),
        CreateAccountScreen.route: (context) => CreateAccountScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        VerificationScreen.route: (context) => VerificationScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        ProductsScreen.route: (context) => ProductsScreen(),
        ProductScreen.route: (context) => ProductScreen(),
        ChooseTownScreen.route: (context) => ChooseTownScreen(),
        CartScreen.route: (context) => CartScreen(),
        CheckoutScreen.route: (context) => CheckoutScreen(),
        CollectorsScreen.route: (context) => CollectorsScreen(),
        AddCollectorScreen.route: (context) => AddCollectorScreen(),
        CollectionPointsScreen.route: (context) => CollectionPointsScreen(),
        SuccessfullScreen.route: (context) => SuccessfullScreen(),
      },
    );
  }
}
