import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  final String exerciseName;

  const ExercisePage({Key? key, required this.exerciseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseName),
      ),
      body: Center(
        child: Text('Здесь будет информация об упражнении $exerciseName'),
      ),
    );
  }
}
