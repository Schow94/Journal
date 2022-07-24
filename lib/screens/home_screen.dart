import 'package:flutter/material.dart';
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

  void initState() {
    super.initState();
    entries = [];
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
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: JournalEntriesList(entries: entries),
      ),
      endDrawer: Drawer(
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
                  onChanged: (value) {
                    // Do something
                  },
                  value: false,
                  // activeTrackColor: Colors.lightGreenAccent,
                  // activeColor: Colors.green,
                ),
              ],
            ),
          ],
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
    setState(() {
      //Do something
      Entry newEntry = Entry(
        title: journalEntry.title,
        body: journalEntry.body,
        date: journalEntry.date,
        rating: journalEntry.rating,
      );
      entries.add(newEntry);
    });
  }
}
