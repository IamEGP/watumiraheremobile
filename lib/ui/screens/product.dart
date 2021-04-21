import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/cart_bloc/cart_bloc.dart';
import 'package:watumira/bloc/quantity_bloc/quantity_bloc.dart';
import 'package:watumira/bloc/selected_bloc/selected_bloc.dart';
import 'package:watumira/data/models/cart.dart';

class ProductScreen extends StatelessWidget {
  static String route = 'product';
  const ProductScreen({Key key}) : super(key: key);

  void _showQuantitySelector(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<SelectedBloc, SelectedState>(
                  builder: (context, state) {
                    if (state is SelectedDataState) {
                      if (state.product != null) {
                        var product = state.product;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context).add(SubtractQuantityFromCart(product: product));
                              },
                              iconSize: 40,
                            ),
                            SizedBox(width: 16),
                            BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                if (state is CartLoadedState) {
                                  var items = state.items.where((item) => item.product.id == product.id);
                                  if (items.isNotEmpty) {
                                    CartItem currentItem = items.first;
                                    return Text(
                                      '${currentItem.quantity}',
                                      style: TextStyle(
                                        fontSize: 64,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }
                                }
                                return Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context).add(AddItemToCartEvent(product: product));
                              },
                              iconSize: 40,
                            ),
                          ],
                        );
                      }
                    }
                    return Container();
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Done'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SelectedDataState selectedState = BlocProvider.of<SelectedBloc>(context).state;
    var product = selectedState.product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name ?? 'Product'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/default-placeholder-image.png',
            image: product.displayImage.original,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            '${product.currency.symbol} ${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            '${product.currency.name} (${product.currency.acronym})',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            product.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              _showQuantitySelector(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
