import 'package:flutter/material.dart';

import '../models/screen_class.dart';
import '../models/entry.dart';

import '../widgets/list_item.dart';

class JournalEntriesList extends StatelessWidget {
  final List<Entry> entries;

  const JournalEntriesList({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Go to journal_entry_screen
              goToJournalEntry(
                context,
                // Pass Entry as args to Navigator
                ScreenArguments(
                  title: entries[index].title,
                  body: entries[index].body,
                  rating: entries[index].rating,
                  date: entries[index].date,
                ),
              );
            },
            child: ListItem(
              title: entries[index].title,
              date: entries[index].date,
            ),
          );
        },
      ),
    );
  }

  /*
    - Navigates to a journal entry
  */
  void goToJournalEntry(BuildContext context, args) {
    Navigator.of(context).pushNamed(
      'journalentry',
      arguments: args,
    );
  }
}
