import 'package:flutter/material.dart';
import 'package:myadjutor/pages/workout/workout_item.dart';

class WorkoutList extends StatelessWidget {
  final List<String> exercises;

  const WorkoutList({Key? key, required this.exercises}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        return WorkoutListItem(
          exerciseName: exercises[index],
        );
      },
    );
  }
}
