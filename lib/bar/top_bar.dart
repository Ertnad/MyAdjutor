import 'package:flutter/material.dart';

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget logo; // Параметр для логотипа
  final VoidCallback? onMenuPressed;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const CustomTopAppBar({
    Key? key,
    required this.logo, // Принимаем логотип как аргумент
    this.onMenuPressed,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: logo,
      centerTitle: true, // Центрирование заголовка
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed ??
                () {
              if (scaffoldKey != null && scaffoldKey!.currentState != null) {
                scaffoldKey!.currentState!.openDrawer();
              }
            },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
