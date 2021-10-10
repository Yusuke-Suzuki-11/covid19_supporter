

import 'dart:js';

import 'package:covid19_supporter/config/api_endpoints.dart';
import 'package:covid19_supporter/repository/api/today_prefectures_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: _getAppBar(),
      body: ListView(
        children: FutureBuilder(
          future: Client.getTest(),
          builder: (context, snapShot){
            return SizedBox();
          }
        ),
      )
    );
  }
  
  AppBar _getAppBar(){
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(''),
      leading: IconButton(
        icon: Icon(Icons.chat_bubble),
        onPressed: () {
          // Client.getTest();
        },
      ),
    );
  }
  
  
}