import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/add_entry_screen.dart';
import 'screens/home_screen.dart';
import 'screens/journal_entry_screen.dart';

class App extends StatefulWidget {
  bool darkTheme;
  late SharedPreferences prefs;

  App(this.darkTheme, prefs);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 17.0),
        ),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: widget.darkTheme ? ThemeMode.dark : ThemeMode.light,
      routes: {
        '/': (context) => Home(widget.darkTheme, setTheme),
        'addentry': (context) => AddEntry(setTheme),
        'journalentry': (context) =>
            JournalEntryScreen(widget.darkTheme, setTheme),
      },
    );
  }

  /*
    - Toggles theme from light --> dark or vice versa
  */
  void setTheme() async {
    setState(() {
      // Toggle Theme from light to dark
      widget.darkTheme = widget.darkTheme ? false : true;
    });

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('dark', widget.darkTheme);
  }
}
