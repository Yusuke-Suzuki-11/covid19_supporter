import 'package:covid19_supporter/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28,
        onPressed: (){
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none),
          iconSize: 28,
          onPressed: (){
          },
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}