import 'package:myadjutor/core/app_export.dart';


class CustomSideMenu extends StatefulWidget {
  final FigmaTextStyles figmaTextStyles;

  const CustomSideMenu({
    Key? key,
    required this.figmaTextStyles,
  }) : super(key: key);

  @override
  _CustomSideMenuState createState() => _CustomSideMenuState();
}

class _CustomSideMenuState extends State<CustomSideMenu> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: Container(
        color: FigmaColors.background,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomText(
              text: '',
              style: widget.figmaTextStyles.mediumText.copyWith(
                color: FigmaColors.main,
              ),
            ),
            SizedBox(height: 5),
            CustomText(
              text: '',
              style: widget.figmaTextStyles.regularText.copyWith(
                color: FigmaColors.main,
              ),
            ),
            SizedBox(height: 30),
            _buildMenuItem(
              icon: Icons.person,
              text: 'Профиль',
              onTap: () {
                AppRoutes.navigateToPageWithFadeTransition(context, ProfilePage());
              },
            ),
            SizedBox(height: 20),
            Divider(
              color: FigmaColors.main.withOpacity(0.2),
              thickness: 1,
            ),
            SizedBox(height: 10),
            CustomText(
              text: 'Основные функции',
              style: widget.figmaTextStyles.regularText.copyWith(
                color: FigmaColors.main,
              ),
            ),
            SizedBox(height: 10),
            _buildMenuItem(
              icon: Icons.home,
              text: 'Главная',
              onTap: () {
                AppRoutes.navigateToPageWithFadeTransition(context, MainPage());
              },
            ),
            _buildMenuItem(
              icon: Icons.calendar_today,
              text: 'Календарь',
              onTap: () {
                AppRoutes.navigateToPageWithFadeTransition(context, CalendarPage());
              },
            ),
            _buildMenuItem(
              icon: Icons.assignment,
              text: 'Задания',
              onTap: () {
              },
            ),
            SizedBox(height: 20),
            Divider(
              color: FigmaColors.main.withOpacity(0.2),
              thickness: 1,
            ),
            SizedBox(height: 10),
            _buildMenuItem(
              icon: Icons.settings,
              text: 'Настройки',
              onTap: () {
                AppRoutes.navigateToPageWithFadeTransition(context, SettingsPage());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    Color? iconColor,
    required VoidCallback onTap, // Обновленный параметр onTap
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? FigmaColors.main,
            ),
            SizedBox(width: 24),
            CustomText(
              text: text,
              style: widget.figmaTextStyles.regularText.copyWith(
                color: FigmaColors.main,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
