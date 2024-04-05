import 'package:flutter/material.dart';
import '../views/infopage.dart';

class SelectButton extends StatelessWidget {
  final String? text;
  final String? title;
  final String? telop;
  final String? maxCelsius;
  final String? minCelsius;
  const SelectButton({this.text, this.title, this.telop, this.maxCelsius, this.minCelsius});

  @override
  Widget build(BuildContext context) {
    //buttomの大きさと位置の設定
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      //buttomの色や形の設定
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey, width: 2),
          ),
        ),
        //textに値が入っていない場合は、buttomのonPressedは無効化
        onPressed: text != null ? null : () {
          //textに値が入っている場合の処理
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
              InfoPage(title, telop, maxCelsius, minCelsius),
            ),
          );
        },
        //textがある場合はtextを表示、その他はtitleを表示
        //text != null ? text : titleは、null制約に引っかかる
        child: Text(text ?? title ?? ''),
      ),
    );
  }
}
