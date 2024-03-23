import 'package:flutter/material.dart';

class CreateWorkoutPage extends StatefulWidget {
  @override
  _CreateWorkoutPageState createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {
  TextEditingController _exerciseNameController = TextEditingController();
  TextEditingController _exerciseDescriptionController = TextEditingController();

  // Метод для сохранения упражнения
  void saveExercise(String exerciseName, String exerciseDescription) {
    // Здесь должна быть ваша логика сохранения данных
    print('Сохранено тренировок: $exerciseName, Описание: $exerciseDescription');

    // Очищаем поля ввода после сохранения
    _exerciseNameController.clear();
    _exerciseDescriptionController.clear();

    // Отправляем данные об упражнении обратно на предыдущий экран
    Navigator.pop(context, {'name': exerciseName, 'description': exerciseDescription});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Создать тренировку'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Название тренировки:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _exerciseNameController,
              decoration: InputDecoration(
                hintText: 'Введите название тренировки',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Описание тренировки:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _exerciseDescriptionController,
              decoration: InputDecoration(
                hintText: 'Введите описание тренировки',
              ),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Получаем данные из полей ввода
                String exerciseName = _exerciseNameController.text;
                String exerciseDescription = _exerciseDescriptionController.text;

                // Выполняем сохранение данных
                saveExercise(exerciseName, exerciseDescription);
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
