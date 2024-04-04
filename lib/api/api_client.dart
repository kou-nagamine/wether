import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';

//世間では、待たせたり待ってもらったりしないひとりぼっちで淡々と処理をこなす関数を非同期関数というらしい、
//不思議な書き方をするものだな
Future<Weatherforecast> fetchWeatherForecast(String citycode) async {
  final url = Uri.parse('https://weather.tsukumijima.net/api/forecast/city/$citycode');
  final response = await http.get(url); //Responseクラスの

  if (response.statusCode == 200) {
    final jsonData = utf8.decode(response.bodyBytes); //utf8にデコードしてるよ  
    final data = json.decode(jsonData); //dartのデータ構造に変換する
    return Weatherforecast.fromJson(data); // 予報データを取得
  } else {
    throw Exception('Failed to load weather forecast data');
  }
}