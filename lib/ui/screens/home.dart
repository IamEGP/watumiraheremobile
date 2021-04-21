import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/home_selected_bloc/home_selected_tab_bloc.dart';
import 'package:watumira/ui/screens/home/cart/home_cart.dart';
import 'package:watumira/ui/screens/home/cart/home_cart_app_bar.dart';
import 'package:watumira/ui/screens/home/main/home_main.dart';
import 'package:watumira/ui/screens/home/main/home_main_app_bar.dart';
import 'package:watumira/ui/screens/home/towns/home_towns.dart';
import 'package:watumira/ui/screens/home/towns/home_towns_app_bar.dart';
import 'package:watumira/ui/screens/home/user/home_user.dart';
import 'package:watumira/ui/screens/home/user/home_user_app_bar.dart';
import 'package:watumira/ui/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  static final String route = 'home_screen';
  const HomeScreen({Key key}) : super(key: key);

  Widget _appBar(int index) {
    var appBars = <Widget>[
      HomeMainAppBar(appBar: AppBar()),
      HomeTownsAppBar(appBar: AppBar()),
      HomeCartAppBar(appBar: AppBar()),
      HomeUserAppBar(appBar: AppBar()),
    ];
    return appBars[index];
  }

  Widget _body(int index) {
    var pages = <Widget>[
      HomeMain(),
      HomeTowns(),
      HomeCart(),
      HomeUser(),
    ];
    return pages[index];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSelectedTabBloc, HomeSelectedTabState>(
      builder: (context, state) {
        if (state is SelectedHomeTab) {
          return Scaffold(
            appBar: _appBar(state.tab),
            body: _body(state.tab),
            drawer: AppDrawer(),
            // bottomNavigationBar: BottomNavigationBar(
            //   type: BottomNavigationBarType.fixed,
            //   onTap: (index) {
            //     BlocProvider.of<HomeSelectedTabBloc>(context).add(SelectHomeTabEvent(tab: index));
            //   },
            //   currentIndex: state.tab,
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.pin_drop),
            //       label: 'Towns',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.shopping_cart),
            //       label: 'Cart',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.person),
            //       label: 'Account',
            //     ),
            //   ],
            // ),
          );
        }
        return Scaffold();
      },
    );
  }
}
