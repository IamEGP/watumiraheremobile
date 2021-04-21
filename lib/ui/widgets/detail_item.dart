import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String value;
  const DetailItem({@required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
