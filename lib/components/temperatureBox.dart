import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final String? highTemperature;
  final String? lowTemperature;
  const Temperature(this.highTemperature, this.lowTemperature, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$highTemperature ℃",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "$lowTemperature ℃",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}