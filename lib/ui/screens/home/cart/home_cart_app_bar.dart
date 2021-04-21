import 'package:flutter/material.dart';

class HomeCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const HomeCartAppBar({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Cart'),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
