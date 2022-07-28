import 'package:flutter/material.dart';
import '../models/entry.dart';
import '../widgets/journal_entries_list.dart';

class VerticalHome extends StatelessWidget {
  final List<Entry> entries;

  const VerticalHome({Key? key, required this.entries}) : super(key: key);

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
