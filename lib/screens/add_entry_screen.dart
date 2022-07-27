import 'package:flutter/material.dart';
import 'package:project4/db/database_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../models/add_entry_screen_arg.dart';
import '../db/journal_entry_dto.dart';

class JournalEntryFields {
  String title = '';
  String body = '';
  DateTime date = DateTime.now();
  int rating = 0;

  String toString() {
    return 'Title: $title, Body: $body, Time: $date, Rating: $rating';
  }
}

class AddEntry extends StatefulWidget {
  VoidCallback setTheme;

  AddEntry(this.setTheme);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  final formKey = GlobalKey<FormState>();
  // final journalEntryFields = JournalEntryFields();

  final journalEntryFields = JournalEntryDTO();

  bool darkTheme = false;

  static const DARK_THEME = 'dark';

  void initState() {
    super.initState();
    // setTheme();
    // loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    // Might be able to use  JournalEntry as ScreenArguments
    final screenargs =
        ModalRoute.of(context)?.settings.arguments as AddEntryScreenArguments;
    final void Function(dynamic) addEntry = screenargs.addEntry;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Journal Entry'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                goBack(context);
              },
              icon: const Icon(Icons.arrow_back),
            );
          },
        ),
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
      body: FractionallySizedBox(
        child: Container(
          height: getHeight(context),
          margin: const EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    // Save value in state
                    journalEntryFields.title = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Body',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    // Save value in state
                    journalEntryFields.body = value!;
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    // Save value in state
                    journalEntryFields.rating = int.parse(value!);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        int.parse(value) < 1 ||
                        int.parse(value) > 4) {
                      return 'Please enter a rating between 1 and 4';
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Background color
                      ),
                      child: const Text('Cancel'),
                      onPressed: () {
                        goToHomeScreen(context);
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () {
                        initDb();

                        if (formKey.currentState!.validate()) {
                          // Stores textfields values in DTO
                          formKey.currentState!.save();
                          // Save to db here
                          // Database.of(context).saveJournalEntry(journalEntryFields);

                          // print(journalEntryFields);
                          addEntry(journalEntryFields);
                          saveEntry(context);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
    - Dynamically set height of FractionallySizedBox() based on screen orientation
  */
  double getHeight(context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.5;
    } else {
      return MediaQuery.of(context).size.height * 1;
    }
  }

  /*
    Navigate to AddEntry Screen
  */
  void goToHomeScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  /*
    Navigate to AddEntry Screen
  */
  void saveEntry(BuildContext context) {
    Navigator.of(context).pop();

    // Save form data to state
  }

  /*
    - Go back to previous/Home screen
  */
  void goBack(context) {
    Navigator.pop(context);
  }

  /*
    - Initialzie dB
  */
  void initDb() async {
    // await deleteDatabase('journal.db');

    // DB was initialized in main.dart
    // We get instance of db now
    final databaseManager = DatabaseManager.getInstance();

    databaseManager.saveJournalEntry(dto: journalEntryFields);
  }

  // void setTheme() async {
  //   setState(() {
  //     // Toggle Theme from light to dark
  //     darkTheme = darkTheme ? false : true;
  //   });

  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setBool(DARK_THEME, darkTheme);
  //   // bool get dark => widget.preferences.getBool(DARK_THEME) ?? false;
  // }

  // void loadTheme() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final dark = preferences.getBool(DARK_THEME);

  //   setState(() {
  //     darkTheme = dark! ? true : false;
  //   });
  // }
}
