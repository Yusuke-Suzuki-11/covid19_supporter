import 'package:covid19_supporter/config/api_endpoints.dart';
import 'package:http/http.dart' as http;

class TodayPrefecturesClient{
  
  
  
  void getData(Uri uri) async {
    final data = await http.get(uri);
    
  }
}