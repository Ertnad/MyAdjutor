import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Отчеты',
        ),
      ],
      selectedItemColor: Colors.blue,
      currentIndex: selectedIndex,
      onTap: (index) {
        // Используем Navigator для перехода между страницами
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/'); // Переход на главную страницу
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/reports'); // Переход на страницу отчетов
        }
      },
    );
  }
}
