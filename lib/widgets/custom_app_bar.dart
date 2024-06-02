import 'package:myadjutor/core/app_export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    Key? key,
    this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: FigmaColors.darkBlueMain), // установить цвет иконки на черный
        onPressed: onMenuPressed,
      ),
      centerTitle: true,
      title: Image.asset(
        ImageConstant.smallIcon,
        width: 40,
        height: 40,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle, color: FigmaColors.darkBlueMain), // установить цвет иконки на черный
          onPressed: () {
            AppRoutes.navigateToPageWithFadeTransition(context, ProfilePage());
          },
        ),
      ],
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
