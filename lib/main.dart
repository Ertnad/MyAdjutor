import 'package:flutter/material.dart';
import 'package:myadjutor/pages/train/train_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget logo = Image.asset('assets/images/train.png', width: 25, // Установка ширины иконки
      height: 25,); // Логотип приложения
    return MaterialApp(
      title: 'MyAdjutor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TrainPage(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        logo: logo, // Передача логотипа в TrainPage
      ),
    );
  }
}
