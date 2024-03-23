import 'package:flutter/material.dart';
import 'package:myadjutor/pages/workout/workout_item_page.dart';


class WorkoutListItem extends StatelessWidget {
  final String exerciseName;

  const WorkoutListItem({Key? key, required this.exerciseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(exerciseName),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ExercisePage(exerciseName: exerciseName)),
        );
      },
    );
  }
}
