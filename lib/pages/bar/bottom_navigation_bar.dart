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
          icon: Icon(Icons.list),
          label: 'Упражнения',
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
        switch (index) {
          case 0:
            Navigator.pushNamed(
                context, '/workouts'); // Переход на страницу списка тренировок
            break;
          case 1:
            Navigator.pushNamed(context, '/'); // Переход на главную страницу
            break;
          case 2:
            Navigator.pushNamed(
                context, '/reports'); // Переход на страницу отчетов
            break;
        }
      },
    );
  }
}
