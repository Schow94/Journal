import 'package:flutter/material.dart';
import '../models/screen_class.dart';
import '../models/entry.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class JournalEntriesList extends StatelessWidget {
  final List<Entry> entries;

  const JournalEntriesList({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      // color: Colors.blue,
      // margin: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              goToJournalEntry(
                context,
                ScreenArguments(
                  title: entries[index].title,
                  body: entries[index].body,
                  rating: entries[index].rating,
                  date: entries[index].date,
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.book_outlined),
                trailing: const Icon(Icons.more_vert),
                title: Text(entries[index].title),
                subtitle: Text(
                  DateFormat('yyy-MM-dd').format(entries[index].date),
                ),
              ),
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
