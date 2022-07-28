import 'package:flutter/material.dart';

import '../models/add_entry_screen_arg.dart';
import '../models/entry.dart';
import '../db/database_manager.dart';

import '../widgets/horizontal_home.dart';
import '../widgets/vertical_home.dart';
import '../widgets/end_drawer.dart';

class Home extends StatefulWidget {
  final VoidCallback setTheme;
  final bool darkTheme;

  Home(this.darkTheme, this.setTheme);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Entry> entries = [];

  void initState() {
    super.initState();
    loadJournal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: entries.isEmpty
            ? const Text('Welcome')
            : const Text('Journal Entries'),
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
      body: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? VerticalHome(entries: entries)
            : HorizontalHome(entries: entries);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToAddEntryScreen(
            context,
            AddEntryScreenArguments(addEntry: addEntry),
          );
        },
        backgroundColor: widget.darkTheme ? Colors.grey : Colors.green,
        child: const Icon(Icons.add),
      ),
      endDrawer:
          EndDrawer(darkTheme: widget.darkTheme, setTheme: widget.setTheme),
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
      // Create new Entry instance
      Entry newEntry = Entry(
        title: journalEntry.title,
        body: journalEntry.body,
        date: DateTime.now(),
        rating: journalEntry.rating,
      );

      // Add entry to entries list in state
      entries.add(newEntry);
    });
  }

  /*
    - Load journal entries from db when component mounts
  */
  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    List<Entry> journalEntries = await databaseManager.journalEntries();

    // Update State w/ journals from db
    setState(() {
      entries = journalEntries;
    });
  }
}
