import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sqflite/sqflite.dart';

import 'screens/add_entry_screen.dart';
import 'screens/home_screen.dart';
import 'screens/journal_entry_screen.dart';

class App extends StatefulWidget {
  final SharedPreferences preferences;

  const App({Key? key, required this.preferences}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static final routes = {
    '/': (context) => const Home(),
    'addentry': (context) => const AddEntry(),
    'journalentry': (context) => const JournalEntryScreen(),
  };

  static const DARK_THEME = 'dark';
  bool get dark => widget.preferences.getBool(DARK_THEME) ?? false;

  void initState() {
    super.initState();

    setTheme();
    loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: dark ? Colors.grey : Colors.green,
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 17.0),
        ),
      ),
      routes: routes,
    );
  }

  void setTheme() async {
    setState(() {
      // Toggle Theme from light to dark
      widget.preferences.setBool(DARK_THEME, dark ? false : true);
    });
  }

  void loadTheme() async {
    setState(() {
      widget.preferences.getBool(DARK_THEME);
    });
  }
}
