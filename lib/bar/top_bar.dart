import 'package:flutter/material.dart';

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget logo; // Добавляем параметр для логотипа
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
      title: logo, // Устанавливаем логотип в качестве заголовка
      centerTitle: true,
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget buildListTile(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
