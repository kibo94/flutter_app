import 'package:flutter/material.dart';
import 'package:my_app/data/http_helper.dart';
import 'package:my_app/models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Text("sadas"),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    var res = await helper.getWeather('London');
    print(result.name);
    setState(() {
      result = res;
    });
  }
}
