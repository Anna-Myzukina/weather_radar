import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:weather_radar/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    print('this line of code is triggered');
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  // void getData() async {
  //   http.Response response = await http.get(Uri.parse(
  //       'api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=97afc688398e7069addf4cc712e23535'));

  //   print(response.body);
  // }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=97afc688398e7069addf4cc712e23535'));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFBF00),
              Color(0xFFFF8008),
              Color(0xFFCE1010),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SizedBox(
            //   // height: 300,
            //   // width: 300,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       getLocation();
            //     },
            //     child: Text('Геолокация'),
            //   ),
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            Center(
              child: SizedBox(
                  height: 400,
                  width: 400,
                  child: Lottie.asset("lottie/earth.json")),
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Center(
              child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Lottie.asset("lottie/circle.json")),
            ),
          ],
        ),
      ),
    );
  }
}
