import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final String title;
  final DateTime date;

  const ListItem({Key? key, required this.title, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.book_outlined),
        trailing: const Icon(Icons.more_vert),
        title: Text(title),
        subtitle: Text(
          DateFormat('yyy-MM-dd').format(date),
        ),
      ),
    );
  }
}
