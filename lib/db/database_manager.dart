import 'package:sqflite/sqflite.dart';
import 'journal_entry_dto.dart';
import '../models/entry.dart';

class DatabaseManager {
  static const String DATABASE_FILENAME = 'journals_2.db';
  static const String SQL_CREATE_SCHEMA =
      'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, date DATETIME)';
  static const String SQL_INSERT =
      'INSERT INTO journal_entries(title, body, rating, date) VALUES (?, ?, ?, ?)';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries';

  // Singleton db instance
  static DatabaseManager _instance = DatabaseManager._();

  final Database db;

  DatabaseManager._({Database? database}) : db = database!;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    final db = await openDatabase(DATABASE_FILENAME, version: 1,
        onCreate: (Database db, int version) async {
      createTables(db, SQL_CREATE_SCHEMA);
    });

    // Initialize single instance of db
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({required JournalEntryDTO dto}) {
    db.transaction((txn) async {
      await txn.rawInsert(
        SQL_INSERT,
        [
          dto.title,
          dto.body,
          dto.rating,
          dto.date.toString(),
        ],
      );
    });
  }

  Future<List<Entry>> journalEntries() async {
    final List<Map> journalRecords = await db.rawQuery(SQL_SELECT);

    final journalEntries = journalRecords.map((record) {
      return Entry(
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        date: DateTime.parse(record['date']),
      );
    }).toList();

    return journalEntries;
  }
}
