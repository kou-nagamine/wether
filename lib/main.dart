import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../api/api_client.dart';
import '../models/weather.dart'; 
import 'infopage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<String> cityCodes = ["080010", "130010", "140010"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("天気予報")),
        body: ListView(
          children: cityCodes.map((code) => FutureBuilder<Weatherforecast>(
            future: fetchWeatherForecast(code),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // ローディング中はインジケータを表示
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // エラーがある場合はエラーメッセージを表示
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                // データがない場合はその旨を表示
                return Text('データがありません');
              } else {
                // データが正常に取得できた場合、その内容を表示
                return ListTile(
                  title: Text('${snapshot.data!.title ?? '不明'}, 天気: ${snapshot.data!.telop}, 最高気温: ${snapshot.data!.maxCelsius ?? '不明'}, 最低気温: ${snapshot.data!.minCelsius ?? '不明'}',
                  ),
                );
              }
            },
          )).toList(),
        ),
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   // 地域コードのリスト
//   final List<String> cityCodes = ["080010", "130010", "140010"];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 150,
//           title: const Align(
//           alignment: Alignment.bottomLeft, 
//           child: Padding(
//             padding: EdgeInsets.only(left:80, bottom:4), // 下部の余白を調整
//             child: Text(
//               '天気予報',
//               style: TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         ),
//         body: ListView(
//           children: cityCodes.map((code) => FutureBuilder<Weatherforecast>(
//             future: fetchWeatherForecast(code), // 各地域コードに対する天気予報を取得
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else if (snapshot.hasData){
//                 // データが正常に取得できた場合、UIに表示
//                 return Container(
//                     width: double.infinity, // ボタンを画面幅いっぱいに広げる
//                     height: 150, // ボタンの高さ
//                     margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           side: const BorderSide(color: Colors.grey, width: 2),
//                         ),
//                       ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => 
//                           InfoPage(
//                             snapshot.data!.title, 
//                             snapshot.data!.telop,
//                             snapshot.data!.maxCelsius,
//                             snapshot.data!.minCelsius
//                           ),
//                         ),
//                       );
//                     }, 
//                     child: Text("${snapshot.data!.title}"),
//                   ),
//                 );
//               } else {
//                 return Text('No data available for city code $code');
//               }
//             },
//           )).toList(),
//         ),
//       ),
//     );
//   }
// }