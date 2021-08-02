import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/worldtime.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  Map data = {};
  // Object? data = {};



  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';

    print(data);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/${bgImage}'),
            fit: BoxFit.cover,
          )
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('Home Screen'),

                  TextButton(onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context,'/choose_location');
                      setState(() {
                        data = {
                          'time' : result['time'], 'location' : result['location'], 'isDayTime' : result['isDayTime'], 'flag' : result['flag']
                        };
                      });
                    }, child: Column(children: [Icon(Icons.edit_location,
                  color: Colors.grey[300],),Text('Edit Location', style: TextStyle(fontSize: 25, color: Colors.grey[300]),)],)),

                  Text(
                      data['location']!,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),),
                  Text(
                    data['time']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  )])

    ),),
      ),
      );
  }
}
