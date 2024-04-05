import 'package:flutter/material.dart';
import "../components/temperature.dart"; // TemperatureBoxウィジェットを正しくインポートしていることを確認してください

class InfoPage extends StatelessWidget {
  final String? title;
  final String? telop;
  final String? maxCelsius;
  final String? minCelsius;

  const InfoPage(this.title, this.telop, this.maxCelsius, this.minCelsius, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 134, 183, 224),
        title: Text(
          title ?? '天気情報',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              telop ?? '情報なし',
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:100),
            Temperature( maxCelsius,  minCelsius),
          ],
        ),
      ),
    );
  }
}
