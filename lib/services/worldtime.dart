import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String url;
  String flag;
  late bool isDayTime;

  WorldTime({ required this.url,required this.location,  required this.flag});


  Future<void> getTime() async {
    try {
      var urla = Uri.parse('http://worldtimeapi.org/api/timezone/${url}');
      Response response = await get(urla);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];

      DateTime now = DateTime.parse(datetime);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('error caught $e');
      time = 'CANNOT LOAD TIME DUE TO ${e}';
    }
  }
}