import 'package:flutter/material.dart';
import '../widgets/journal_entries_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entries'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToAddEntryScreen(context);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: const SingleChildScrollView(
        child: JournalEntriesList(),
      ),
    );
  }

  /*
    Navigate to AddEntry Screen
  */
  void goToAddEntryScreen(BuildContext context) {
    Navigator.of(context).pushNamed('addentry');
  }
}
