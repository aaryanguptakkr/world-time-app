import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtimeapp/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:worldtimeapp/services/worldtime.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void SetupTime() async{
    WorldTime instance =  WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location, 'time' : instance.time, 'flag' : instance.flag, 'isDayTime' : instance.isDayTime
    });
  }


  @override
  void initState() {
    super.initState();
    // log('Inside Initstate');
    SetupTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(

          child : SpinKitCubeGrid(color: Colors.red, size: 50.0,),
            // TextButton(onPressed: (){
            //   Navigator.pushNamed(context,'/choose_location');
            // }, child: Row(
            //   children : [ Text('Edit Location'), Icon(Icons.edit_location) ]
            // )
            // ),
            // Text('$time'),

        ),
      );
  }
}
