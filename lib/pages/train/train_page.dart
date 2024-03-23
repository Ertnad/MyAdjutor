import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myadjutor/bar/bottom_navigation_bar.dart';
import 'package:myadjutor/bar/side_menu.dart';
import 'package:myadjutor/bar/top_bar.dart';

class TrainPage extends StatefulWidget {
  final Widget logo;

  const TrainPage({Key? key, required this.logo}) : super(key: key);

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
      if (value == null || DateTime.now().difference(value) >= const Duration(days: 1)) {
        fetchQuote();
      } else {
        setState(() {
          lastUpdateDate = value;
        });
      }
    });
  }

  Future<void> fetchQuote() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random?tags=inspirational|life'));
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
      return DateTime.now().subtract(const Duration(days: 1)); // Assume the quote was not updated
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
    return Scaffold(
      appBar: CustomTopAppBar(
        logo: widget.logo,
      ),
      drawer: const CustomDrawer(),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _getGreeting(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        _getDayInfo(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
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
              padding: const EdgeInsets.only(top: 50), // Добавляем отступ для показа заголовка вверху
              child: Text('Другой контент здесь'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0,
      ),
    );
  }

  String _getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Доброго утра';
    } else if (hour < 17) {
      return 'Доброго дня';
    } else {
      return 'Доброго вечера';
    }
  }

  String _getDayInfo() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE dd MMMM', 'ru');
    var dayInfo = formatter.format(now);
    return capitalizeFirstLetter(dayInfo);
  }

  String capitalizeFirstLetter(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }
}
