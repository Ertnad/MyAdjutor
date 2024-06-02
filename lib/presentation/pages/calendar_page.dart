import 'package:myadjutor/core/app_export.dart';

class CalendarPage extends StatefulWidget {

  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: CustomSideMenu(figmaTextStyles: FigmaTextStyles()),
      body: CalendarPageContent(),
      bottomNavigationBar: CustomBottomBar(currentPage: 'calendar'), // Добавляем кастомный нижний бар
    );
  }
}
