import 'dart:core';

/*
  - Class to help pass Entry as a Navigator arg
*/
class ScreenArguments {
  final String title;
  final String body;
  final int rating;
  final DateTime date;

  ScreenArguments({
    required this.title,
    required this.date,
    required this.body,
    required this.rating,
  });
}
