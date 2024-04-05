import 'package:flutter/material.dart';
import "../views/selectpage.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: selectpage(), // InsertDataScreenをメイン画面として使用
    );
  }
}