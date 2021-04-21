import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoadingItem extends StatelessWidget {
  const ProductLoadingItem({Key key}) : super(key: key);

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
              Shimmer.fromColors(
                baseColor: Colors.grey[200],
                highlightColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  height: 180,
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                height: 12,
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                height: 12,
                width: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
