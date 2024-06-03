import 'package:myadjutor/widgets/local_notifications.dart';

import 'core/app_export.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  // Устанавливаем стиль для статус-бара глобально
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: FigmaColors.background,
    systemNavigationBarDividerColor: FigmaColors.background,
  ));

  initializeDateFormatting('ru').then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppMetrica.activate(AppMetricaConfig('18ca9986-9ada-44a9-9b66-379cffdccc9a'));
    return MaterialApp(
      title: 'MyAdjutor',
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
