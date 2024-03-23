import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Widget logo;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.logo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Список тренировок',
        ),
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
        switch(index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/workouts'); // Переход на страницу списка тренировок
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/'); // Переход на главную страницу
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/reports'); // Переход на страницу отчетов
            break;
        }
      },
    );
  }
}
