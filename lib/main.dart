import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/appBar.dart';
import 'firebase_options.dart';
import './views/homePage.dart';
import './views/productsPage.dart';
import './views/explorePage.dart';
import './views/favoritesPage.dart';
import './styles/mainStyle.dart'; // Make sure this import is correct
import './components/bottomNavBar.dart';
// Ensure you have imported appBar.dart correctly if it's used.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  final List<Widget> _pages = [
    MyHomePage(),
    productsPage(),
    explorePage(),
    favoritesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use your themes for the MaterialApp
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme, // Use the light theme
      darkTheme: darkTheme, // Use the dark theme
      themeMode: _themeMode, // Use the current theme mode
      home: Scaffold(
        appBar: CustomAppBar(title: 'App Title'),
        drawer: Drawer(
          backgroundColor: _themeMode == ThemeMode.light ? light5 : dark2, // White in light mode, black in dark mode
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: _themeMode == ThemeMode.light ? light3 : dark1,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: _themeMode == ThemeMode.light ? light5 : light5,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Dark Mode',
                  style: TextStyle(
                    color: _themeMode == ThemeMode.dark ? light5 : dark1, // light5 in dark mode, default in light mode
                  ),
                ),
                trailing: Switch(
                  value: _themeMode == ThemeMode.dark,
                  onChanged: (val) {
                    _toggleTheme(val);
                  },
                ),
              ),
              // ... other drawer items
            ],
          ),
        ),



        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onItemSelected: _onItemTapped,
        ),
      ),
    );
  }
}
