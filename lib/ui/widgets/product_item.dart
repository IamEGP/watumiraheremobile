import 'package:flutter/material.dart';
import 'package:watumira/data/models/products.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onTap;
  const ProductItem({Key key, @required this.product, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/default-placeholder-image.png',
                image: product.displayImage.thumbnail,
              ),
              // Image(
              //   image: NetworkImage(product.displayImage.thumbnail),
              // ),
              SizedBox(height: 16),
              Text(
                product.name.length > 30 ? '${product.name.substring(0, 27)}...' : product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${product.currency.symbol} ${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
