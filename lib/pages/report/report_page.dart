import 'package:flutter/material.dart';
import 'package:myadjutor/pages/base_page.dart';

class ReportPage extends StatelessWidget {
  final int selectedIndex;
  final Widget logo;

  const ReportPage({
    required this.selectedIndex,
    required this.logo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: ListView(
        children: [
          Center(
            child: Text('Report Page'),
          ),
        ],
      ),
      selectedIndex: selectedIndex,
      logo: logo,
    );
  }
}
