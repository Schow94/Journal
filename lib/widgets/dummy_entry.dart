import 'package:flutter/material.dart';

import '../models/entry.dart';

import '../widgets/horizontal_child.dart';

class DummyEntry extends StatelessWidget {
  final List<Entry> entries;

  const DummyEntry({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
