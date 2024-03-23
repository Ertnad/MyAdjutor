import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myadjutor/pages/train/train_page.dart';
import 'package:myadjutor/pages/report/report_page.dart';
import 'package:myadjutor/pages/workout/workout_page.dart'; // Импортируем новую страницу

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
      initialRoute: '/', // Устанавливаем начальный маршрут
      routes: {
        '/': (context) => TrainPage(selectedIndex: 1, logo: logo), // Главная страница
        '/reports': (context) => ReportPage(selectedIndex: 2, logo: logo), // Страница отчетов
        '/workouts': (context) => WorkoutListPage(selectedIndex: 0, logo: logo), // Страница со списком тренировок
      },
    );
  }
}
