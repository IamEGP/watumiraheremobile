import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';
import 'package:watumira/bloc/authentication/authentication_bloc.dart';
import 'package:watumira/bloc/cart_bloc/cart_bloc.dart';
import 'package:watumira/bloc/towns/towns_bloc.dart';
import 'package:watumira/ui/screens/cart.dart';
import 'package:watumira/ui/screens/towns.dart';

class HomeMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const HomeMainAppBar({Key key, this.appBar}) : super(key: key);

  _showFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.pin_drop,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Select Town'),
              subtitle: BlocBuilder<TownsBloc, TownsState>(
                builder: (context, state) {
                  if (state is TownsLoadedState) {
                    if (state.userTown != null) {
                      return Text(state.userTown.name);
                    }
                  }
                  return Text('No town selected');
                },
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(ChooseTownScreen.route);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Select Product Type'),
              subtitle: Text('No product type selected'),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('WatumiraHere'),
      actions: [
        IconButton(
          icon: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadedState) {
                if (state.items.isNotEmpty) {
                  var count = state.count;
                  var countString = count < 10 ? '$count' : '9+';

                  return Badge(
                    badgeContent: Text(
                      countString,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: count < 10 ? 16 : 10,
                      ),
                    ),
                    child: Icon(Icons.shopping_bag),
                    badgeColor: Colors.white,
                  );
                }
              }
              return Icon(Icons.shopping_bag);
            },
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.route);
          },
        ),
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            _showFilter(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
