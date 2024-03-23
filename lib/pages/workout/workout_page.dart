import 'package:flutter/material.dart';
import 'package:myadjutor/pages/bar/bottom_navigation_bar.dart';
import 'package:myadjutor/pages/workout/workout_item_page.dart';


class WorkoutListPage extends StatelessWidget {
  final int selectedIndex;
  final Widget logo;

  const WorkoutListPage({Key? key, required this.selectedIndex, required this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список упражнений'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Упражнение 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExercisePage(exerciseName: 'Упражнение 1')),
              );
            },
          ),
          ListTile(
            title: Text('Упражнение 2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExercisePage(exerciseName: 'Упражнение 2')),
              );
            },
          ),
          // Добавьте сюда остальные упражнения...
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: selectedIndex),
    );
  }
}
