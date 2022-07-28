/*
  - Journal Entry
*/
class Entry {
  final String title;
  final String body;
  final int rating;
  DateTime date = DateTime.now();

  Entry({
    required this.title,
    required this.body,
    required this.rating,
    required this.date,
  });
}
