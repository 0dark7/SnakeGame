import 'package:flutter/material.dart';
import 'package:ornekler/main_menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake Game',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen
      ),
      home: MainMenuPage(name: '',value: 1),
    );
  }
}