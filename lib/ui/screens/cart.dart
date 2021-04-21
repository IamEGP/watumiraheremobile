import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/cart_bloc/cart_bloc.dart';
import 'package:watumira/bloc/selected_bloc/selected_bloc.dart';
import 'package:watumira/ui/screens/checkout.dart';
import 'package:watumira/ui/screens/product.dart';
import 'package:watumira/ui/widgets/cart_bottom_item.dart';

class CartScreen extends StatelessWidget {
  static final String route = 'cart_screen';
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            if (state.count > 0) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        var item = state.items[index];
                        var product = item.product;
                        return ListTile(
                          title: Text(product.name),
                          subtitle: Text('${product.currency.symbol}${product.price.toStringAsFixed(2)} x ${item.quantity}'),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel_outlined),
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context).add(RemoveItemFromCartEvent(product: product));
                            },
                          ),
                          leading: FadeInImage.assetNetwork(
                            placeholder: 'assets/default-placeholder-image.png',
                            image: product.displayImage.thumbnail,
                          ),
                          onTap: () {
                            BlocProvider.of<SelectedBloc>(context).add(SelectProductEvent(product: product));
                            Future.delayed(Duration(milliseconds: 500), () {
                              Navigator.of(context).pushNamed(ProductScreen.route);
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        CartBottomItem(
                          title: 'Subtotal',
                          value: '${state.currency.symbol}${state.subTotal.toStringAsFixed(2)}',
                        ),
                        SizedBox(height: 12),
                        CartBottomItem(
                          title: 'Service Fee',
                          value: '${state.currency.symbol}${state.serviceFee.toStringAsFixed(2)}',
                        ),
                        SizedBox(height: 12),
                        CartBottomItem(
                          title: 'Total',
                          value: '${state.currency.symbol}${state.total.toStringAsFixed(2)}',
                          isTotal: true,
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(CheckoutScreen.route);
                                },
                                child: Text('Checkout'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
