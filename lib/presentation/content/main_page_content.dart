import 'package:myadjutor/core/app_export.dart';
import 'package:myadjutor/widgets/local_notifications.dart';

class MainPageContent extends StatefulWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  _MainPageContentState createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  final FigmaTextStyles figmaTextStyles = FigmaTextStyles();
  int allTasks = 1;
  int notCompletedTasks = 1;

  @override
  void initState() {
    super.initState();
  }

  List<NotificationItem> notifications = [];

  void _showNotifications() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomNotification(notifications: notifications);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
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
                      color: FigmaColors.darkBlueMain,
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications, color: FigmaColors.darkBlueMain, size: 28),
                        onPressed: _showNotifications,
                      ),
                      if (notifications.isNotEmpty)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            child: Center(
                              child: Text(
                                '${notifications.length}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: CustomText(
                  text: 'Статистика',
                  style: figmaTextStyles.header1Medium.copyWith(
                    color: FigmaColors.darkBlueMain,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Используем CustomPieChart для отображения круговой диаграммы
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
              payload: "This is simple data");},
          label: Text('Нажми сюда сука'),
        )
      ],
    );
  }
}
