import 'package:flutter/material.dart';
import '../models/entry.dart';
import '../widgets/journal_entries_list.dart';
import '../widgets/horizontal_child.dart';

class HorizontalHome extends StatelessWidget {
  List<Entry> entries;

  HorizontalHome({Key? key, required this.entries}) : super(key: key);

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
