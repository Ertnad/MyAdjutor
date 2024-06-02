import 'package:myadjutor/widgets/local_notifications.dart';

import 'core/app_export.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Устанавливаем стиль для статус-бара глобально
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // делает статус-бар прозрачным
    statusBarIconBrightness: Brightness.dark, // устанавливает цвет иконок в статус-баре на темный (черный)
    statusBarBrightness: Brightness.dark, // для iOS
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();

  initializeDateFormatting('ru').then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppMetrica.activate(AppMetricaConfig('18ca9986-9ada-44a9-9b66-379cffdccc9a'));
    return MaterialApp(
      title: 'ProjectPal',
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
