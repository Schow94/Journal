import 'package:flutter/material.dart';
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
              context, AddEntryScreenArguments(addEntry: addEntry));
        },
        backgroundColor: darkTheme ? Colors.grey : Colors.green,
        child: const Icon(Icons.add),
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
                  value: darkTheme,
                  onChanged: (value) {
                    // Calling parent Widget's method from child
                    widget.setTheme();
                  },
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
        date: DateTime.now(),
        rating: journalEntry.rating,
      );
      entries.add(newEntry);
    });
  }

  /*
    - Load journal entries from db when component mounts
  */
  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    List<Entry> journalEntries = await databaseManager.journalEntries();

    // Update State
    setState(() {
      entries = journalEntries;
    });
  }
}

class VerticalHome extends StatelessWidget {
  List<Entry> entries;

  VerticalHome({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: entries.isNotEmpty
            ? JournalEntriesList(entries: entries)
            : const Icon(Icons.book, size: 90.0),
      ),
    );
  }
}

class HorizontalHome extends StatelessWidget {
  List<Entry> entries;

  HorizontalHome({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: entries.isNotEmpty
                ? JournalEntriesList(entries: entries)
                : const Icon(Icons.book, size: 90.0),
          ),
        ),
        const VerticalDivider(
          width: 20,
          thickness: 1,
          indent: 20,
          endIndent: 0,
          color: Color.fromARGB(255, 224, 224, 224),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Center(
            child: HorizontalChild(
              firstEntry: entries.isNotEmpty
                  ? entries.first
                  : Entry(
                      title: 'Test',
                      body: 'Test',
                      rating: 1,
                      date: DateTime.now(),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalChild extends StatelessWidget {
  Entry firstEntry;

  HorizontalChild({Key? key, required this.firstEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          firstEntry.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(firstEntry.body),
      ],
    );
  }
}
