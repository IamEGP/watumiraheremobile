import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/selected_bloc/selected_bloc.dart';
import 'package:watumira/bloc/towns/towns_bloc.dart';

class CollectionPointsScreen extends StatelessWidget {
  static final String route = 'collection_points_screen';
  const CollectionPointsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Collection Point'),
      ),
      body: BlocBuilder<TownsBloc, TownsState>(
        builder: (context, state) {
          if (state is TownsLoadedState) {
            var collectionPoints = state.userTown.collectionPoints;
            return ListView.builder(
              itemBuilder: (context, index) {
                var collectionPoint = collectionPoints[index];
                return ListTile(
                  title: Text(collectionPoint.name),
                  onTap: () {
                    BlocProvider.of<SelectedBloc>(context).add(SelectCollectionPointEvent(collectionPoint: collectionPoint));
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Selected ${collectionPoint.name} as the collection point.'),
                      ),
                    );
                  },
                );
              },
              itemCount: collectionPoints.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
