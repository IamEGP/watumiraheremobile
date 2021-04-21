import 'package:flutter/material.dart';

class HomeUserAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const HomeUserAppBar({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('User'),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
