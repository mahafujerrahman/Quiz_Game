import 'package:flutter/material.dart';
import 'package:quiz_game/View_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
       body: ViewPage(),
      ),
      debugShowCheckedModeBanner: false,
    );

  }
}