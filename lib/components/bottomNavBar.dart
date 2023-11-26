// custom_bottom_nav_bar.dart
import 'package:flutter/material.dart';
import '../styles/mainStyle.dart'; // Adjust the import path if necessary

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // Determine the theme mode to apply the correct colors
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: isDarkMode ? dark1 : light3,
      selectedItemColor: isDarkMode ? light5 : light1,
      unselectedItemColor: isDarkMode ? dark3 : dark1,
      currentIndex: widget.currentIndex,
      onTap: widget.onItemSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
    );
  }
}
