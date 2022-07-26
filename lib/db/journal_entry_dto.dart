class JournalEntryDTO {
  String title = '';
  String body = '';
  int rating = 1;
  DateTime? date;

  String toString() =>
      'Title: $title, Body: $body, Rating: $rating, Date: $date';
}
