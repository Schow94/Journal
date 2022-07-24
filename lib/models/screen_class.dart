import 'dart:core';

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
