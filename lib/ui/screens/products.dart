import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/products_bloc/products_bloc.dart';
import 'package:watumira/bloc/selected_bloc/selected_bloc.dart';
import 'package:watumira/ui/screens/product.dart';
import 'package:watumira/ui/widgets/loading.dart';
import 'package:watumira/ui/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  static String route = 'products';
  const ProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectedDataState selectedState = BlocProvider.of<SelectedBloc>(context).state;
    var town = selectedState.town;
    var title = town != null ? '${town.name} Products' : 'Products';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadedState) {
              var products = state.products.docs;
              return GridView.count(
                childAspectRatio: 3 / 4.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                children: List.generate(products.length, (index) {
                  var product = products[index];
                  return ProductItem(
                    product: product,
                    onTap: () {
                      BlocProvider.of<SelectedBloc>(context).add(SelectProductEvent(product: product));
                      Future.delayed(Duration(milliseconds: 500), () {
                        Navigator.of(context).pushNamed(ProductScreen.route);
                      });
                    },
                  );
                }),
              );
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
