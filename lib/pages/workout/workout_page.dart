import 'package:flutter/material.dart';
import 'package:myadjutor/pages/base_page.dart';

class WorkoutListPage extends StatelessWidget {
  final int selectedIndex;
  final Widget logo;

  const WorkoutListPage({
    required this.selectedIndex,
    required this.logo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: ListView.builder(
        itemCount: 15, // Замените на фактическое количество тренировок
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Workout ${index + 1}'),
            subtitle: Text('Description of workout ${index + 1}'),
            onTap: () {
              // Обработка нажатия на элемент списка
            },
          );
        },
      ),
      selectedIndex: selectedIndex,
      logo: logo,
    );
  }
}
