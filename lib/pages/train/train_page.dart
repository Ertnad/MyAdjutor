import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myadjutor/pages/base_page.dart';

class TrainPage extends StatefulWidget {
  final Widget logo;
  final int selectedIndex; // Добавлен параметр selectedIndex

  const TrainPage({Key? key, required this.logo, required this.selectedIndex}) : super(key: key);

  @override
  _TrainPageState createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  late String quote = '';
  late DateTime lastUpdateDate;

  @override
  void initState() {
    super.initState();
    getLastUpdateDate().then((value) {
      if (value == null ||
          DateTime.now().difference(value) >= const Duration(days: 1)) {
        fetchQuote();
      } else {
        setState(() {
          lastUpdateDate = value;
        });
      }
    });
  }

  Future<void> fetchQuote() async {
    final response = await http.get(
        Uri.parse('https://api.quotable.io/random?tags=inspirational|life'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final newQuote = jsonData['content'];
      setState(() {
        quote = newQuote;
        lastUpdateDate = DateTime.now();
      });
      saveLastUpdateDate(lastUpdateDate);
    } else {
      throw Exception('Failed to load quote');
    }
  }

  Future<DateTime?> getLastUpdateDate() async {
    final prefs = await SharedPreferences.getInstance();
    final dateString = prefs.getString('lastUpdateDate');
    if (dateString != null) {
      return DateTime.parse(dateString);
    } else {
      return DateTime.now().subtract(
          const Duration(days: 1)); // Assume the quote was not updated
    }
  }

  Future<void> saveLastUpdateDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastUpdateDate', date.toIso8601String());
  }

  Future<void> _handleRefresh() async {
    await fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          children: <Widget>[
            WelcomeAndDayInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Цитата:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      quote.isNotEmpty ? quote : 'Загрузка цитаты...',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(
                  top: 50), // Добавляем отступ для показа заголовка вверху
              child: const Text('Другой контент здесь'),
            ),
          ],
        ),
      ),
      selectedIndex: widget.selectedIndex, // Используем selectedIndex здесь
      logo: widget.logo,
    );
  }
}
