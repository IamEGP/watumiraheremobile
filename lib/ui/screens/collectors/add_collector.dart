import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/add_collector_bloc/add_collector_bloc.dart';
import 'package:watumira/bloc/collectors_bloc/collectors_bloc.dart';

class AddCollectorScreen extends StatelessWidget {
  static final String route = 'add_collector_screen';
  const AddCollectorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Collector'),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Full name',
              ),
              onChanged: (e) {
                BlocProvider.of<AddCollectorBloc>(context).add(AddCollectorName(name: e));
              },
              textCapitalization: TextCapitalization.words,
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: 'Phone number',
              ),
              keyboardType: TextInputType.phone,
              onChanged: (e) {
                BlocProvider.of<AddCollectorBloc>(context).add(AddCollectorPhoneNumber(phoneNumber: e));
              },
            ),
            SizedBox(height: 12),
            BlocConsumer<AddCollectorBloc, AddCollectorState>(
              listener: (context, state) {
                print(state);
                if (state is CollectorsLoadedState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('A collector was successfully added.')));
                  // Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state is AddCollectorFormData) {
                  if (state.name.isNotEmpty && state.phoneNumber.isNotEmpty) {
                    return ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        BlocProvider.of<CollectorsBloc>(context).add(AddCollector(name: state.name, phoneNumber: state.phoneNumber));
                      },
                      child: Text('Save'),
                    );
                  }
                }
                return ElevatedButton(
                  onPressed: null,
                  child: Text('Save'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
