import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/cart_bloc/cart_bloc.dart';
import 'package:watumira/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:watumira/bloc/selected_bloc/selected_bloc.dart';
import 'package:watumira/data/models/collectors.dart';
import 'package:watumira/data/models/towns.dart';
import 'package:watumira/ui/screens/collection_points.dart';
import 'package:watumira/ui/screens/collectors/collectors.dart';
import 'package:watumira/ui/screens/successful_screen.dart';
import 'package:watumira/ui/widgets/detail_item.dart';

class CheckoutScreen extends StatelessWidget {
  static final String route = 'checkout_screen';
  const CheckoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: BlocConsumer<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutProcessSuccessfull) {
            Navigator.of(context).pushNamedAndRemoveUntil(SuccessfullScreen.route, (Route<dynamic> route) => route.isFirst);
          }
          if (state is CheckoutProcessFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is CheckoutProcessing) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              ListTile(
                title: Text('Selector collector'),
                subtitle: BlocBuilder<SelectedBloc, SelectedState>(
                  builder: (context, state) {
                    if (state is SelectedDataState) {
                      if (state.collector != null) {
                        return Text(state.collector.name);
                      }
                    }
                    return Text('No collector selected');
                  },
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(CollectorsScreen.route);
                },
              ),
              ListTile(
                title: Text('Select collection point'),
                subtitle: BlocBuilder<SelectedBloc, SelectedState>(
                  builder: (context, state) {
                    if (state is SelectedDataState) {
                      if (state.collectionPoint != null) {
                        return Text(state.collectionPoint.name);
                      }
                    }
                    return Text('No collector selected');
                  },
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(CollectionPointsScreen.route);
                },
              ),
              SizedBox(height: 16),
              BlocBuilder<SelectedBloc, SelectedState>(
                builder: (context, state) {
                  if (state is SelectedDataState) {
                    if (state.collectionPoint != null && state.collector != null) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _showProceed(context);
                          },
                          child: Text('Verifiy Infomation'),
                        ),
                      );
                    }
                  }
                  return Container();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  _showProceed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Information'),
          content: BlocBuilder<SelectedBloc, SelectedState>(
            builder: (context, state) {
              if (state is SelectedDataState) {
                if (state.collectionPoint != null && state.collector != null) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DetailItem(title: 'Collector Name: ', value: state.collector.name),
                        DetailItem(title: 'Collector Phone: ', value: state.collector.phoneNumber.replaceAll(' ', '')),
                        DetailItem(title: 'Collection Point: ', value: state.collectionPoint.name),
                      ],
                    ),
                  );
                }
              }

              return Container();
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                var collector = _getCollector(context);
                var collectionPoint = _getCollectionPoint(context);
                var cartState = _cartLoadedState(context);

                BlocProvider.of<CheckoutBloc>(context).add(
                  CheckoutCartEvent(
                    collectionPoint: collectionPoint,
                    collector: collector,
                    items: cartState.items,
                    serviceFee: cartState.serviceFee,
                    subTotal: cartState.subTotal,
                    total: cartState.total,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: Text('Proceed'),
            ),
          ],
        );
      },
    );
  }

  Collector _getCollector(BuildContext context) {
    var state = BlocProvider.of<SelectedBloc>(context).state;
    if (state is SelectedDataState) {
      return state.collector;
    }
    return null;
  }

  CollectionPoint _getCollectionPoint(BuildContext context) {
    var state = BlocProvider.of<SelectedBloc>(context).state;
    if (state is SelectedDataState) {
      return state.collectionPoint;
    }
    return null;
  }

  CartLoadedState _cartLoadedState(BuildContext context) {
    var state = BlocProvider.of<CartBloc>(context).state;
    if (state is CartLoadedState) {
      return state;
    }
    return null;
  }
}
