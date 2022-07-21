import 'package:flutter/material.dart';
import 'screens/add_entry_screen.dart';
import 'screens/home_screen.dart';
import 'screens/journal_entry_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final routes = {
    '/': (context) => const Home(),
    'addentry': (context) => const AddEntry(),
    'journalentry': (context) => const JournalEntryScreen(),
  };

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
      routes: routes,
    );
  }
}
