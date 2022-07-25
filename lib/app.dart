import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'screens/add_entry_screen.dart';
import 'screens/home_screen.dart';
import 'screens/journal_entry_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static final routes = {
    '/': (context) => const Home(),
    'addentry': (context) => const AddEntry(),
    'journalentry': (context) => const JournalEntryScreen(),
  };

  void initState() {
    super.initState();
    // initTheme();
    // entries = [];
    // Create theme table in db
  }

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

  // void initTheme() async {
  //   // Create theme table in db

  //   final Database database = await openDatabase('journal.db', version: 1,
  //       onCreate: (Database db, int version) async {
  //     await db.execute(
  //       'CREATE TABLE IF NOT EXISTS theme(id INTEGER PRIMARY KEY AUTOINCREMENT, dark INTEGER);',
  //     );
  //   });

  //   // Add entry into db 0 is False
  //   await database.transaction((txn) async {
  //     await txn.rawInsert(
  //       'INSERT INTO theme(dark) VALUES (?);',
  //       [0],
  //     );
  //   });

  //   // Query db for all journal entries
  //   List<Map> themeRecords = await database.rawQuery('SELECT * FROM theme;');
  //   print('THEME: $themeRecords');
  // }
}
