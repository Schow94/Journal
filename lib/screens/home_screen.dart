import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/database_manager.dart';
import 'package:project4/models/add_entry_screen_arg.dart';

import '../widgets/journal_entries_list.dart';
import '../models/entry.dart';

import '../models/add_entry_screen_arg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Entry> entries = [];
  bool darkTheme = false;

  void initState() {
    super.initState();
    loadJournal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Journal Entries'),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.settings,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToAddEntryScreen(
              context, AddEntryScreenArguments(addEntry: addEntry));
        },
        backgroundColor: darkTheme ? Colors.green : Colors.red,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: JournalEntriesList(entries: entries),
      ),
      endDrawer: Drawer(
        child: Container(
          color: darkTheme ? Colors.grey : Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const SizedBox(
                height: 90.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text('Settings'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Dark Mode'),
                  Switch(
                    value: darkTheme,
                    onChanged: (value) {
                      // Do something
                      // changeTheme();
                    },
                    // activeTrackColor: Colors.lightGreenAccent,
                    // activeColor: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*
    Navigate to AddEntry Screen
  */
  void goToAddEntryScreen(BuildContext context, args) {
    Navigator.of(context).pushNamed(
      'addentry',
      arguments: args,
    );
  }

  /*
    - Add an entry to entries list
  */
  void addEntry(journalEntry) {
    print(journalEntry);

    setState(() {
      //Do something
      Entry newEntry = Entry(
        title: journalEntry.title,
        body: journalEntry.body,
        date: DateTime.now(),
        rating: journalEntry.rating,
      );
      entries.add(newEntry);
    });
  }

  // Load journal entries from db when component mounts
  void loadJournal() async {
    // await deleteDatabase('journals.db');
    final databaseManager = DatabaseManager.getInstance();
    List<Entry> journalEntries = await databaseManager.journalEntries();

    // final Database database = await openDatabase('journals.db', version: 1,
    //     onCreate: (Database db, int version) async {
    //   await db.execute(
    //     'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, date DATETIME)',
    //   );

    //   await db.execute(
    //     'CREATE TABLE IF NOT EXISTS theme(id INTEGER PRIMARY KEY AUTOINCREMENT, dark INTEGER)',
    //   );
    // });

    // await database.transaction((txn) async {
    //   await txn.rawInsert(
    //     'INSERT INTO theme(dark) VALUES (?)',
    //     [0],
    //   );
    // });

    // // Query db for all journal entries
    // List<Map> themeRecords = await database.rawQuery('SELECT * FROM theme');
    // print('THEME: $themeRecords');

    // // Query db for all journal entries
    // List<Map> journalRecords =
    //     await database.rawQuery('SELECT * FROM journal_entries');
    // // print(journalRecords);

    // // Map through []Maps to get []JournalEntry
    // final journalEntries = journalRecords.map((record) {
    //   return Entry(
    //     title: record['title'],
    //     body: record['body'],
    //     rating: record['rating'],
    //     date: DateTime.parse(record['date']),
    //   );
    // }).toList();

    // Update State
    setState(() {
      entries = journalEntries;
      // darkTheme = themeRecords[0]['dark'] == 0 ? false : true;
      // if (themeRecords[0]['dark'] == 0) {
      //   darkTheme = false;
      // } else {
      //   darkTheme = true;
      // }
    });
  }

  // void changeTheme() async {
  //   // final Database database = await openDatabase('journals.db', version: 1,
  //   //     onCreate: (Database db, int version) async {
  //   //   await db.execute(
  //   //     'CREATE TABLE IF NOT EXISTS theme(id INTEGER PRIMARY KEY AUTOINCREMENT, dark INTEGER)',
  //   //   );
  //   // });

  //   await database.transaction((txn) async {
  //     int darkVal = darkTheme == false ? 1 : 0;

  //     await txn.rawInsert(
  //       "UPDATE theme SET dark=? WHERE id=1",
  //       [darkVal],
  //     );
  //   });

  //   List<Map> themeRecords = await database.rawQuery('SELECT * FROM theme');
  //   print('THEME: $themeRecords');

  //   setState(() {
  //     darkTheme = themeRecords[0]['dark'] == 0 ? false : true;
  //   });
  // }
}
