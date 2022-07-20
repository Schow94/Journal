import 'package:flutter/material.dart';
import '../models/screen_class.dart';

class JournalEntriesList extends StatelessWidget {
  const JournalEntriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            goToJournalEntry(
              context,
              ScreenArguments('Journal Entry #1', 'Wednesday July 20, 2022',
                  'The Navigator provides the ability to navigate to a named route from any part of an app using a common identifier. In some cases, you might also need to pass arguments to a named route. For example, you might wish to navigate to the /user route and pass information about the user to that route.'),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Journal Entry #1',
                style: Theme.of(context).textTheme.headline6,
              ),
              const Text('Wednesday July 20, 2022'),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: Color.fromARGB(255, 230, 229, 229),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #2',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #3',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #4',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #5',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #6',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #7',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #8',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #9',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journal Entry #10',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Wednesday July 20, 2022'),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Color.fromARGB(255, 230, 229, 229),
            ),
          ],
        ),
      ],
    );
  }

  void goToJournalEntry(BuildContext context, args) {
    Navigator.of(context).pushNamed(
      'journalentry',
      arguments: args,
    );
  }
}
