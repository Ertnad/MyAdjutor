import 'package:flutter/material.dart';
import '../../bar/bottom_navigation_bar.dart'; // Импортируйте страницу отчетов
import '../../bar/top_bar.dart'; // Импортируйте кастомный AppBar
import '../../bar/side_menu.dart'; // Импортируйте кастомное меню

class TrainPage extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;
  final Widget logo; // Добавляем логотип как параметр

  TrainPage({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.logo, // Принимаем логотип как аргумент
    Key? key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomTopAppBar(
        logo: logo, // Передаем логотип
        scaffoldKey: _scaffoldKey,
      ),
      body: Container(),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
      drawer: const CustomDrawer(),
    );
  }
}
