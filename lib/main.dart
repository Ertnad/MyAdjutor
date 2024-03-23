import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myadjutor/pages/train/train_page.dart';
import 'package:myadjutor/pages/report/report_page.dart'; // Импортируем страницу отчетов

void main() {
  initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      initialRoute: '/', // Установим начальный маршрут
      routes: {
        '/': (context) => TrainPage(logo: logo), // Главная страница
        '/reports': (context) => ReportPage(selectedIndex: 1), // Страница отчетов
      },
    );
  }
}
