import 'package:myadjutor/core/app_export.dart';

class CustomCalendarGrid extends StatelessWidget {
  final List<DateTime> daysInMonth;
  final Map<DateTime, List<int>> taskIdsPerDay;

  CustomCalendarGrid({required this.daysInMonth, required this.taskIdsPerDay});

  @override
  Widget build(BuildContext context) {
    final FigmaTextStyles figmaTextStyles = FigmaTextStyles();

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 16),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: daysInMonth.map((DateTime dateTime) {
          final int dayOfMonth = dateTime.day;
          final int dayOfWeek = dateTime.weekday;
          final Color dayColor = _getDayColor(dayOfWeek);

          final List<int>? taskIds = taskIdsPerDay[dateTime];
          final int tasksCount = taskIds?.length ?? 0;

          return GestureDetector(
            onTap: () {
            },
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: dayColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getDayOfWeekName(dayOfWeek),
                    style: figmaTextStyles.regularText.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 4),
                  Text(
                    dayOfMonth.toString(),
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      tasksCount > 8 ? 8 : tasksCount,
                          (index) => _buildTaskIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTaskIndicator() {
    return Container(
      width: 8,
      height: 16,
      margin: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
    );
  }

  Color _getDayColor(int dayOfWeek) {
    return (dayOfWeek == 6 || dayOfWeek == 7) ? FigmaColors.exitDayColor : FigmaColors.workDayColor;
  }

  String _getDayOfWeekName(int dayOfWeek) {
    switch (dayOfWeek) {
      case 1:
        return 'Понедельник';
      case 2:
        return 'Вторник';
      case 3:
        return 'Среда';
      case 4:
        return 'Четверг';
      case 5:
        return 'Пятница';
      case 6:
        return 'Суббота';
      case 7:
        return 'Воскресенье';
      default:
        return '';
    }
  }
}
