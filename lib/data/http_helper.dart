import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_app/models/weather_model.dart';

class HttpHelper {
  //  https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  final String authority = "api.openweathermap.org";
  final String path = "data/2.5/weather";
  final String apiKey = "e72afd6def09304635f54f7002f895ed";

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, "appId": apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
