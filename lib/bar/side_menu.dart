import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Меню',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Главная'),
            onTap: () {
              // Обработка нажатия на "Главная"
              Navigator.pop(context); // Закрываем сайд-меню
              Navigator.pushReplacementNamed(context, '/home'); // Переходим на страницу "Главная"
            },
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Отчеты'),
            onTap: () {
              // Обработка нажатия на "Отчеты"
              Navigator.pop(context); // Закрываем сайд-меню
              Navigator.pushReplacementNamed(context, '/reports'); // Переходим на страницу "Отчеты"
            },
          ),
          // Другие пункты меню
        ],
      ),
    );
  }
}
