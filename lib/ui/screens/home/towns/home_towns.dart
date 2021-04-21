import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/products_bloc/products_bloc.dart';
import 'package:watumira/bloc/selected_bloc/selected_bloc.dart';
import 'package:watumira/bloc/towns/towns_bloc.dart';
import 'package:watumira/data/models/towns.dart';
import 'package:watumira/ui/screens/products.dart';

class HomeTowns extends StatelessWidget {
  const HomeTowns({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TownsBloc, TownsState>(
      builder: (context, state) {
        if (state is TownsLoadedState) {
          return _townsList(state.towns);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
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
            BlocProvider.of<SelectedBloc>(context).add(SelectTownEvent(town: town));
            BlocProvider.of<ProductsBloc>(context).add(FetchProductsEvent(town: town.slug));
            Navigator.of(context).pushNamed(ProductsScreen.route);
          },
        );
      },
      itemCount: towns.docs.length,
    );
  }
}
