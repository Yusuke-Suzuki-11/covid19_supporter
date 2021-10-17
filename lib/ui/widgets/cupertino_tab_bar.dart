import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTabBar extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar
    );
  }
}

class CupertinoTabBar {}