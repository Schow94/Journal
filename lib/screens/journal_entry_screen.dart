import 'package:flutter/material.dart';
import '../models/screen_class.dart';

class JournalEntryScreen extends StatelessWidget {
  const JournalEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenargs =
        ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    final String title = screenargs.title;
    final String date = screenargs.date;
    final String content = screenargs.content;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entries'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline5),
            Text(date),
            Text(content),
          ],
        ),
      ),
    );
  }
}
