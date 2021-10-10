import 'dart:convert';

import 'package:covid19_supporter/config/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Client{
  static Future<String> _getData(Uri uri) async {
    final data = await http.get(uri);
    return data.body;
  }
  
  
  static Future<List<Widget>> getTest() async {
    String json = await _getData(ApiEndpoints.prefecturesTodaysData);
    List data = jsonDecode(json);
    List<Widget> list = [];
    
    for (Map<String, dynamic> item in data) {
      list.add(_getListItem(item['name_ja'].toString(), item['cases']));
    }
    
    return list;
  }
  
  static Widget _getListItem(String name, int number){
    return Container(
      child: Row(
        children: [
          Text(name),
          Text(number.toString())
        ]
      )
    );
  }
}