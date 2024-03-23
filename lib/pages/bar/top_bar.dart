import 'package:flutter/material.dart';

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget logo;
  final VoidCallback? onMenuPressed;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const CustomTopAppBar({
    Key? key,
    required this.logo,
    this.onMenuPressed,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: logo,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed != null
            ? () {
          if (scaffoldKey != null) {
            scaffoldKey!.currentState!.openDrawer();
          }
        }
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
