import 'package:flutter/material.dart';
import 'package:myadjutor/pages/bar/bottom_navigation_bar.dart';
import 'package:myadjutor/pages/workout/create_workout_page.dart';
import 'package:myadjutor/pages/workout/workout_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutListPage extends StatefulWidget {
  final int selectedIndex;
  final Widget logo;

  const WorkoutListPage({Key? key, required this.selectedIndex, required this.logo}) : super(key: key);

  @override
  _WorkoutListPageState createState() => _WorkoutListPageState();
}

class _WorkoutListPageState extends State<WorkoutListPage> {
  List<String> exercises = [];

  @override
  void initState() {
    super.initState();
    loadExercises();
  }

  Future<void> loadExercises() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedExercises = prefs.getStringList('exercises') ?? [];
    setState(() {
      exercises = loadedExercises;
    });
  }

  Future<void> saveExercises(List<String> exercises) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('exercises', exercises);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список упражнений'),
      ),
      body: WorkoutList(exercises: exercises), // Передаем список упражнений в виджет WorkoutList
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Открываем страницу создания упражнения и ожидаем результат
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateWorkoutPage()),
          );

          // Если результат не равен null, то добавляем новое упражнение в список
          if (result != null && result is Map<String, String>) {
            setState(() {
              exercises.add(result['name']!);
            });
            await saveExercises(exercises);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: widget.selectedIndex, logo: widget.logo),
    );
  }
}
