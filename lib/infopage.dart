import 'package:flutter/material.dart';
import "components/temperatureBox.dart";

class InfoPage extends StatelessWidget {
  final String? title;
  final String? telop;
  final String? maxCelsius;
  final String? minCelsius;

  const InfoPage(this.title, this.telop, this.maxCelsius, this.minCelsius);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(213, 126, 235, 255).withOpacity(0.7),
        title: Text(
          '${title}の詳細情報',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              const Color.fromARGB(213, 126, 235, 255).withOpacity(0.8),
              const Color.fromARGB(252, 203, 144, 255).withOpacity(0.8),
            ],
            stops: const [
              0.0,
              1.0,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image.network(
            //     "https://cdn.dap.dmm.co.jp/11/beff13d08cb72423316763997e9d52a2.jpg",
            //     alignment: Alignment.centerRight,
            //     width: 400),
            // pokotin.weather == 'Unknown'
            //     ? const Column(children: [
            //         Text('データがありません'),
            //       ])
            //     : Column(children: [
            //         CircleImg(pokotin.weather),
            //         Text(
            //           '天気: ${pokotin.weather}',
            //           style: const TextStyle(
            //             fontSize: 30,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ]),
            Temperature(maxCelsius,minCelsius),
          ],
        ),
      ),
    );
  }
}