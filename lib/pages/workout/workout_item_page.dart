import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  final String exerciseName;

  const ExercisePage({Key? key, required this.exerciseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Фотография в блоке с названием упражнения
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/athlete.jpg', // Путь к изображению спортсмена
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5), // Применяем затемнение
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      exerciseName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Пространство между блоком с фотографией и следующим блоком
            // Блок с информацией о времени и количестве упражнений
            Container(
              color: Colors.grey[200], // Цвет блока с информацией
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Продолжительность:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '45 мин', // Примерное время выполнения
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Упражнений:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '10', // Количество упражнений
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Пространство между блоком с информацией и блоками упражнений
            // Блоки с упражнениями (тестовые)
            ListTile(
              title: Text('Упражнение 1'),
            ),
            ListTile(
              title: Text('Упражнение 2'),
            ),
            // Пространство между упражнениями и кнопкой "Начать"
            SizedBox(height: 20),
            // Кнопка "Начать"
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  // Действие по нажатию на кнопку "Начать"
                },
                child: Text('Начать'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15), // Увеличиваем отступы кнопки
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Закругляем углы
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
