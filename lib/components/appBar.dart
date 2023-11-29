import 'package:flutter/material.dart';

import '../styles/mainStyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: theme.brightness == Brightness.dark ? light4 : dark4, // light5 for dark mode, dark1 for light mode
        ),
      ),
      backgroundColor: theme.primaryColor, // Use the primary color of the theme
      iconTheme: theme.appBarTheme.iconTheme,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}
