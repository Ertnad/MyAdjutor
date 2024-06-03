import 'package:intl/intl.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_calendar_grid.dart';

class CalendarPageContent extends StatefulWidget {

  const CalendarPageContent({Key? key}) : super(key: key);

  @override
  _CalendarPageContentState createState() => _CalendarPageContentState();
}

class _CalendarPageContentState extends State<CalendarPageContent> {
  final FigmaTextStyles figmaTextStyles = FigmaTextStyles();
  DateTime currentDate = DateTime.now();
  late String token;
  Map<DateTime, List<int>> taskIdsPerDay = {}; // Изменено на Map<DateTime, List<int>>
  late int groupId;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List<DateTime> daysInMonth = _getDaysInMonth(currentDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: CustomText(
                        text: 'Календарь',
                        style: figmaTextStyles.header1Medium.copyWith(
                          color: FigmaColors.main,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8),
                  CustomButton(
                    text: DateFormat('MMMM', 'ru').format(currentDate),
                    onPressed: () {},
                    figmaTextStyles: figmaTextStyles,
                    showArrows: true,
                    onTapArrowLeft: () {
                      setState(() {
                        currentDate = DateTime(currentDate.year, currentDate.month - 1);
                        daysInMonth = _getDaysInMonth(currentDate);
                      });
                    },
                    onTapArrowRight: () {
                      setState(() {
                        currentDate = DateTime(currentDate.year, currentDate.month + 1);
                        daysInMonth = _getDaysInMonth(currentDate);
                      });
                    },
                  ),
                  SizedBox(width: 8),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomCalendarGrid(
                daysInMonth: daysInMonth,
                taskIdsPerDay: taskIdsPerDay,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DateTime> _getDaysInMonth(DateTime currentDate) {
    final int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;
    final List<DateTime> days = [];
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(currentDate.year, currentDate.month, i));
    }
    return days;
  }
}
