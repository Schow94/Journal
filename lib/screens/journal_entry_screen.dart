import 'package:flutter/material.dart';
import 'package:project4/widgets/end_drawer.dart';
import '../models/screen_class.dart';
import 'package:intl/intl.dart';

import '../widgets/horizontal_entry_screen.dart';
import '../widgets/vertical_entry_screen.dart';

class JournalEntryScreen extends StatelessWidget {
  final VoidCallback setTheme;
  final bool darkTheme;

  const JournalEntryScreen(this.darkTheme, this.setTheme);

  @override
  Widget build(BuildContext context) {
    // Pull args off of ScreenArgs from Navigator
    final screenargs =
        ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    final String title = screenargs.title;
    final DateTime date = screenargs.date;
    final String body = screenargs.body;
    final int rating = screenargs.rating;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('yyyy-MM-dd').format(date),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                // Navigate to previous screen
                goBack(context);
              },
              icon: const Icon(Icons.arrow_back),
            );
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.settings,
                ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth < 400
            ? VerticalEntryScreen(
                title: title,
                date: date,
                body: body,
                rating: rating,
                makeStars: makeStars(context, rating),
              )
            : HorizontalEntryScreen(
                title: title,
                date: date,
                body: body,
                rating: rating,
                makeStars: makeStars(context, rating),
              );
      }),
      endDrawer: EndDrawer(
        darkTheme: darkTheme,
        setTheme: setTheme,
      ),
    );
  }

  /*
    - Go back to previous/Home screen
  */
  void goBack(context) {
    Navigator.pop(context);
  }

  /*
    - Dynamically renders stars to represent rating
  */
  Widget makeStars(BuildContext context, int rating) {
    // Hold stars
    List<Widget> stars = [];

    // Add filled stars
    for (int i = 0; i < rating; i++) {
      stars.add(
        const Icon(Icons.star, color: Colors.green),
      );
    }

    // Add emtpy stars
    for (int i = 0; i < 4 - rating; i++) {
      stars.add(
        const Icon(Icons.star),
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: stars);
  }
}
