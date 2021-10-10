

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: _getAppBar(),
      body: ListView(
        children: [
          ListTile(
            
          ),
        ],
      )
    );
  }
  
  AppBar _getAppBar(){
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(''),
    );
  }
}