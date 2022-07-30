import 'package:flutter/material.dart';
import 'package:project4/db/database_manager.dart';

import '../models/add_entry_screen_arg.dart';
import '../db/journal_entry_dto.dart';

import '../widgets/end_drawer.dart';
import '../widgets/drop_down.dart';

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
  final bool darkTheme;

  AddEntry(this.darkTheme, this.setTheme);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryDTO();

  bool darkTheme = false;

  static const DARK_THEME = 'dark';

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                DropdownRatingFormField(maxRating: 4, onSaved: saveRating),
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
      endDrawer:
          EndDrawer(darkTheme: widget.darkTheme, setTheme: widget.setTheme),
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
    // DB was initialized in main.dart
    // We get instance of db now
    final databaseManager = DatabaseManager.getInstance();

    databaseManager.saveJournalEntry(dto: journalEntryFields);
  }

  /*
    - Save rating
  */
  void saveRating(value) {
    // Save value in state
    journalEntryFields.rating = value!;
  }
}
