import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey; // Добавьте scaffoldKey в ваш CustomDrawer

  const CustomDrawer({Key? key, this.scaffoldKey}) : super(key: key);

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
              scaffoldKey?.currentState?.openDrawer(); // Используйте scaffoldKey для открытия сайд-меню
            },
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Отчеты'),
            onTap: () {
              scaffoldKey?.currentState?.openDrawer(); // Используйте scaffoldKey для открытия сайд-меню
            },
          ),
          // Другие пункты меню
        ],
      ),
    );
  }
}
