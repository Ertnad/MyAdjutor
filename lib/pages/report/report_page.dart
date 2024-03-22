import 'package:flutter/material.dart';
import '../../bar/bottom_navigation_bar.dart'; // Импортируйте страницу отчетов

class ReportPage extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const ReportPage({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
      ),
      body: Container(), // Пустой контейнер для тестирования
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
