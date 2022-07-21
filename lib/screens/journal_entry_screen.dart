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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
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
            ? VerticalLayout(title: title, date: date, content: content)
            : HorizontalLayout(title: title, date: date, content: content);
      }),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const SizedBox(
              height: 90.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text('Settings'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Dark Mode'),
                Switch(
                  onChanged: (value) {
                    // Do something
                  },
                  value: false,
                  // activeTrackColor: Colors.lightGreenAccent,
                  // activeColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /*
    - Go back to previous/Home screen
  */
  void goBack(context) {
    Navigator.pop(context);
  }
}

class VerticalLayout extends StatelessWidget {
  final title;
  final date;
  final content;

  const VerticalLayout({Key? key, this.title, this.date, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Theme.of(context).textTheme.headline6),
                Text(' - '),
                Text(date, style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalLayout extends StatelessWidget {
  final title;
  final date;
  final content;

  const HorizontalLayout({Key? key, this.title, this.date, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(date),
                  ],
                ),
              ),
              const VerticalDivider(
                width: 20,
                thickness: 1,
                indent: 20,
                endIndent: 0,
                color: Color.fromARGB(255, 224, 224, 224),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(content),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
