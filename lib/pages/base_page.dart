import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myadjutor/pages/bar/bottom_navigation_bar.dart';
import 'package:myadjutor/pages/bar/side_menu.dart';
import 'package:myadjutor/pages/bar/top_bar.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final Widget logo;
  final Future<void> Function()? onRefresh; // Make onRefresh nullable
  final Widget? floatingActionButton; // Add floatingActionButton parameter

  const BasePage({
    required this.body,
    required this.selectedIndex,
    required this.logo,
    this.onRefresh, // Update the parameter to be nullable
    this.floatingActionButton, // Add floatingActionButton parameter
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
        logo: logo,
      ),
      drawer: const CustomDrawer(),
      body: RefreshIndicator(
        onRefresh: onRefresh ?? () async {}, // Provide a default value if onRefresh is null
        child: body,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        logo: logo,
      ),
      floatingActionButton: floatingActionButton, // Set floatingActionButton
    );
  }
}

class WelcomeAndDayInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getGreeting(),
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                _getDayInfo(),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Доброго утра';
    } else if (hour < 17) {
      return 'Доброго дня';
    } else {
      return 'Доброго вечера';
    }
  }

  String _getDayInfo() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE dd MMMM', 'ru');
    var dayInfo = formatter.format(now);
    return capitalizeFirstLetter(dayInfo);
  }

  String capitalizeFirstLetter(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }
}
