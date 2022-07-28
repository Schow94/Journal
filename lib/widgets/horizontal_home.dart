import 'package:flutter/material.dart';

import '../models/entry.dart';

import '../widgets/journal_entries_list.dart';
import '../widgets/dummy_entry.dart';

class HorizontalHome extends StatelessWidget {
  final List<Entry> entries;

  const HorizontalHome({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: entries.isNotEmpty
              ? JournalEntriesList(entries: entries)
              : const Icon(Icons.book, size: 90.0),
        ),
        const VerticalDivider(
          width: 20,
          thickness: 1,
          indent: 20,
          endIndent: 0,
          color: Color.fromARGB(255, 224, 224, 224),
        ),
        DummyEntry(entries: entries),
      ],
    );
  }
}
