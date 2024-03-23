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
              Navigator.pop(context);
              // Обработка нажатия на "Главная"
            },
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Отчеты'),
            onTap: () {
              Navigator.pop(context);
              // Обработка нажатия на "Отчеты"
            },
          ),
          // Другие пункты меню
        ],
      ),
    );
  }
}

