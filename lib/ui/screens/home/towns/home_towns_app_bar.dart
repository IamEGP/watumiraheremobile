import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watumira/bloc/towns/towns_bloc.dart';

class HomeTownsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const HomeTownsAppBar({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Watumirahere'),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            BlocProvider.of<TownsBloc>(context).add(LoadTownsEvent(limit: 30));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
