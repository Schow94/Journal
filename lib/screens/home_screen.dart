import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../db/database_manager.dart';
import 'package:project4/models/add_entry_screen_arg.dart';

import '../widgets/journal_entries_list.dart';
import '../models/entry.dart';

import '../models/add_entry_screen_arg.dart';

class Home extends StatefulWidget {
  VoidCallback setTheme;

  Home(this.setTheme);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool darkTheme = false;

  static const DARK_THEME = 'dark';

  List<Entry> entries = [];

  void initState() {
    super.initState();
    loadJournal();
    // setTheme();
    // loadTheme();
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
        backgroundColor: darkTheme ? Colors.grey : Colors.green,
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
                      // Calling parent Widget's method from child
                      widget.setTheme();
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

    // Update State
    setState(() {
      entries = journalEntries;
    });
  }
}
