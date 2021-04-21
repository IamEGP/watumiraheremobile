import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/collectors_bloc/collectors_bloc.dart';
import 'package:watumira/bloc/selected_bloc/selected_bloc.dart';
import 'package:watumira/data/models/collectors.dart';
import 'package:watumira/ui/screens/collectors/add_collector.dart';

class CollectorsScreen extends StatelessWidget {
  static final String route = 'collectors_screen';
  const CollectorsScreen({Key key}) : super(key: key);

  _confirmDelete(BuildContext context, Collector collector) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Collector?'),
            content: Text('Are you sure you want to delete collector with the name ${collector.name}?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<CollectorsBloc>(context).add(DeleteCollector(id: collector.id));
                  Navigator.of(context).pop();
                },
                child: Text('Yes'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Collectors'),
      ),
      body: BlocBuilder<CollectorsBloc, CollectorsState>(
        builder: (context, state) {
          if (state is CollectorsLoadedState) {
            var collectors = state.collectors;
            return ListView.builder(
              itemBuilder: (context, index) {
                var collector = collectors[index];
                return ListTile(
                  title: Text(collector.name),
                  subtitle: Text(collector.phoneNumber),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _confirmDelete(context, collector);
                    },
                  ),
                  onTap: () {
                    BlocProvider.of<SelectedBloc>(context).add(SelectCollectorEvent(collector: collector));
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${collector.name} has been selected as collector.'),
                      ),
                    );
                  },
                );
              },
              itemCount: collectors.length,
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddCollectorScreen.route);
        },
      ),
    );
  }
}
