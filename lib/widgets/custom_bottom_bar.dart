import 'package:myadjutor/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {

  final String currentPage;


  const CustomBottomBar({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: FigmaColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildBottomBarItem(
              context: context,
              icon: Icons.calendar_today,
              text: 'Календарь',
              pageName: 'calendar',
            ),
          ),
          Expanded(
            child: _buildBottomBarItem(
              context: context,
              icon: Icons.home,
              text: 'Главная',
              pageName: 'main',
            ),
          ),
          Expanded(
            child: _buildBottomBarItem(
              context: context,
              icon: Icons.assignment,
              text: 'Задания',
              pageName: 'task',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBarItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String pageName,
  }) {
    final bool isSelected = pageName == currentPage;
    final Color selectorColor = isSelected ? FigmaColors.selectorColor : FigmaColors.darkSelectorColor;

    return InkWell(
      onTap: () {
        // Навигация при нажатии на элемент
        if (!isSelected) {
          switch (pageName) {
            case 'calendar':
              AppRoutes.navigateToPageWithFadeTransition(context, CalendarPage()); // Пример использования маршрутов
              break;
            case 'main':
              AppRoutes.navigateToPageWithFadeTransition(context, MainPage());
              break;
            default:
              break;
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selectorColor,
          ),
          SizedBox(height: 4),
          CustomText(
            text: text,
            style: TextStyle(
              color: selectorColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
