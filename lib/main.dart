import 'package:flutter/material.dart';
import 'package:worldtimeapp/Pages/home.dart';
import 'package:worldtimeapp/Pages/choose_location.dart';
import 'package:worldtimeapp/Pages/loading.dart';
void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: '/home',
    routes:{
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/choose_location' : (context) => ChooseLocation()
    }
  ));
}
