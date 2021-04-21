import 'package:flutter/material.dart';

class CartBottomItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;
  const CartBottomItem({Key key, this.title, this.value, this.isTotal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isTotal != null && isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isTotal != null && isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
