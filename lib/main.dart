import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myadjutor/pages/bar/side_menu.dart';
import 'package:myadjutor/pages/bar/top_bar.dart';
import 'package:myadjutor/pages/train/train_page.dart';
import 'package:myadjutor/pages/report/report_page.dart';
import 'package:myadjutor/pages/workout/workout_page.dart';

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
    );

    return MaterialApp(
      title: 'MyAdjutor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TrainPage(logo: logo, selectedIndex: 1,),
        '/reports': (context) => ReportPage(selectedIndex: 2, logo: logo),
        '/workouts': (context) => WorkoutListPage(selectedIndex: 0, logo: logo),
      },
    );
  }
}
