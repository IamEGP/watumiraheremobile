import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/towns/towns_bloc.dart';
import 'package:watumira/data/models/towns.dart';
import 'package:watumira/ui/screens/home.dart';

class ChooseTownScreen extends StatelessWidget {
  static final String route = 'choose_town_screen';
  const ChooseTownScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Town'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: BlocBuilder<TownsBloc, TownsState>(
        builder: (context, state) {
          if (state is TownsLoadedState) {
            return _townsList(state.towns);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _townsList(Towns towns) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var town = towns.docs[index];
        return ListTile(
          title: Text(town.name),
          subtitle: Text('Collection Points: ${town.collectionPoints.length}'),
          onTap: () {
            BlocProvider.of<TownsBloc>(context).add(SaveTownEvent(slug: town.slug));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Loading products for ${town.name}...')));
            Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.route, (Route<dynamic> route) => false);
          },
        );
      },
      itemCount: towns.docs.length,
    );
  }
}
