import "package:flutter/material.dart";
import "../models/weather.dart";
import "../api/api_client.dart";
import "../components/buttom.dart";

class selectpage extends StatelessWidget {
  // 地域コードのリスト
  final List<String> cityCodes = ["080010", "130010", "140010"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          title: const Align(
          alignment: Alignment.bottomLeft, 
          child: Padding(
            padding: EdgeInsets.only(left:107, bottom:4), // 下部の余白を調整
            child: Text(
              '天気予報',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ),
        body: ListView(
          children: cityCodes.map((code) => FutureBuilder<Weatherforecast>(
            future: fetchWeatherForecast(code), // 各地域コードに対する天気予報へのrequestを送る
            builder: (context, snapshot) {      // APIから返ってきたreponseをsnapshotが受け取る
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SelectButton(text:"少し時間をあけてください");
              } else if (snapshot.hasError) {
                return SelectButton(text:"エラー");
              } else if (snapshot.hasData){
                return SelectButton(
                  title:snapshot.data!.title, 
                  telop:snapshot.data!.telop, 
                  maxCelsius: snapshot.data!.maxCelsius,
                  minCelsius: snapshot.data!.minCelsius);
              } else {
                return Text('No data available for city code $code');
              }
            },
          )).toList(),
        ),
      ),
    );
  }
}