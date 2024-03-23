import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:myadjutor/bar/bottom_navigation_bar.dart';
import 'package:myadjutor/bar/side_menu.dart';
import 'package:myadjutor/bar/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrainPage extends StatefulWidget {
  final Widget logo;

  const TrainPage({Key? key, required this.logo}) : super(key: key);

  @override
  _TrainPageState createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
    final response = await http.get(Uri.parse('https://api.quotable.io/random?tags=inspirational|life&language=ru'));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomTopAppBar(
        logo: widget.logo,
        scaffoldKey: scaffoldKey,
      ),
      drawer: const CustomDrawer(),
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
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
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Цитата:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  quote.isNotEmpty ? quote : 'Загрузка цитаты...',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0,
        onItemTapped: (index) {
          // Handle bottom navigation bar item tapped
        },
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
