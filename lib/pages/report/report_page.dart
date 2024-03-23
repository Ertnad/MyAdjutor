import 'package:flutter/material.dart';
import '../../bar/bottom_navigation_bar.dart'; // Импортируйте страницу отчетов

class ReportPage extends StatelessWidget {
  final int selectedIndex;

  const ReportPage({
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
      ),
      body: const Text('Report Page'), // Пустой контейнер для тестирования
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
      ),
    );
  }
}