import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myadjutor/pages/base_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrainPage extends StatelessWidget {
  final Widget logo;
  final int selectedIndex;

  const TrainPage({
    Key? key,
    required this.logo,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: _TrainPageContent(),
      selectedIndex: selectedIndex,
      logo: logo,
    );
  }
}

class _TrainPageContent extends StatefulWidget {
  @override
  _TrainPageContentState createState() => _TrainPageContentState();
}

class _TrainPageContentState extends State<_TrainPageContent> {
  late String quote = '';
  late DateTime lastUpdateDate;
  bool _isRefreshing = false;

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
    setState(() {
      _isRefreshing = true; // Установим флаг обновления перед запросом
    });
    final response = await http.get(
      Uri.parse('https://api.quotable.io/random?tags=inspirational|life'),
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final newQuote = jsonData['content'];
      setState(() {
        quote = newQuote;
        lastUpdateDate = DateTime.now();
        _isRefreshing = false; // Сбросим флаг обновления после получения данных
      });
      saveLastUpdateDate(lastUpdateDate);
    } else {
      setState(() {
        _isRefreshing = false; // Обработка ошибки, сброс флага обновления
      });
      throw Exception('Failed to load quote');
    }
  }

  Future<DateTime?> getLastUpdateDate() async {
    final prefs = await SharedPreferences.getInstance();
    final dateString = prefs.getString('lastUpdateDate');
    if (dateString != null) {
      return DateTime.parse(dateString);
    } else {
      return DateTime.now().subtract(const Duration(days: 1));
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
    return RefreshIndicator(
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
            padding: const EdgeInsets.only(top: 50),
            child: const Text('Другой контент здесь'),
          ),
        ],
      ),
    );
  }
}
