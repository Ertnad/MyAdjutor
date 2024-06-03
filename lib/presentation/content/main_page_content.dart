import 'package:flutter/material.dart';
import 'package:myadjutor/core/app_export.dart';
import 'package:myadjutor/core/utils/api_service.dart';
import 'package:myadjutor/widgets/local_notifications.dart';

class MainPageContent extends StatefulWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  _MainPageContentState createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  final FigmaTextStyles figmaTextStyles = FigmaTextStyles();
  final APIService _apiService = APIService();
  String _quote = '';
  int allTasks = 1;
  int notCompletedTasks = 1;

  @override
  void initState() {
    super.initState();
    _fetchQuote();
  }

  Future<void> _fetchQuote() async {
    final quote = await _apiService.getMotivationalQuote();
    setState(() {
      _quote = quote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FigmaColors.background, // Здесь вы можете задать нужный вам цвет фона
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Здраствуйте,\n' + 'Да',
                      style: figmaTextStyles.header2Regular.copyWith(
                        color: FigmaColors.main,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: CustomText(
                    text: 'Статистика',
                    style: figmaTextStyles.header1Medium.copyWith(
                      color: FigmaColors.main,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CustomText(
                      text: _quote.isNotEmpty ? _quote : 'Загрузка цитаты...',
                      style: figmaTextStyles.regularText
                          .copyWith(color: FigmaColors.main),
                      align: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Center(
                      child: CustomPieChart(
                        allTasks: allTasks,
                        incompleteTasks: notCompletedTasks,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.notifications_outlined),
                    onPressed: () {
                      LocalNotifications.showSimpleNotification(
                          title: "Simple Notification",
                          body: "This is a simple notification",
                          payload: "This is simple data");
                    },
                    label: Text('Нажми сюда сука'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
