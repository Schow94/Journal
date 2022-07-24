// Model for how a JournalEntry should look
class Entry {
  String title;
  String body;
  int rating;
  DateTime date;

  Entry({
    required this.title,
    required this.body,
    required this.rating,
    required this.date,
  });
}
