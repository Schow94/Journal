import 'package:flutter/material.dart';

class HorizontalEntryScreen extends StatelessWidget {
  final String title;
  final DateTime date;
  final String body;
  final int rating;
  final Widget makeStars;

  const HorizontalEntryScreen({
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
                    // Row of stars
                    makeStars,
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
                child: Text(body),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
