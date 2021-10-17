import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget with PreferredSizeWidget{
  CustomAppBar({ this.interface});
  String? interface;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.green,
      title: Text(''),
      leading: IconButton(
        icon: Icon(Icons.chat_bubble),
        onPressed: () {
        },
      )
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}