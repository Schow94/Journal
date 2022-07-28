import 'package:flutter/material.dart';

class VerticalEntryScreen extends StatelessWidget {
  final String title;
  final DateTime date;
  final String body;
  final int rating;
  final Widget makeStars;

  const VerticalEntryScreen({
    Key? key,
    required this.title,
    required this.date,
    required this.body,
    required this.rating,
    required this.makeStars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Theme.of(context).textTheme.headline6),
              ],
            ),
            // Row of stars
            makeStars,
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              body,
              style: const TextStyle(
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
