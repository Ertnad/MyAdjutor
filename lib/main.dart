import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myadjutor/pages/train/train_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logo = Image.asset(
      'assets/images/train.png',
      width: 35,
      height: 35,
    ); // Логотип приложения

    return MaterialApp(
      title: 'MyAdjutor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: TrainPage(logo: logo),
      ),
    );
  }
}
