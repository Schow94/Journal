import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

import '../models/entry.dart';
import 'journal_entry_dto.dart';

class DatabaseManager {
  // ----------------------------------- CONSTANTS -----------------------------------
  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_INSERT =
      'INSERT INTO journal_entries(title, body, rating, date) VALUES (?, ?, ?, ?)';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries';
  static var SQL_CREATE_FILE = 'assets/sql_schema.txt';

  // Singleton db manager instance
  static DatabaseManager _instance = DatabaseManager._();

  // Single db instance
  final Database db;
  // Name constructor for private db instance
  DatabaseManager._({Database? database}) : db = database!;

  /*
    - Returns db instance so there's only single instance of db that exists
  */
  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  /*
    - Initialize single db instance
  */
  static Future initialize() async {
    // Read db schema from text file
    String SQL_CREATE_SCHEMA = await rootBundle.loadString(SQL_CREATE_FILE);

    // Open db
    final db = await openDatabase(
      DATABASE_FILENAME,
      version: 1,
      onCreate: (Database db, int version) async {
        // create tables if 1st time
        createTables(db, SQL_CREATE_SCHEMA);
      },
    );

    // Initialize single instance of db
    _instance = DatabaseManager._(database: db);
  }

  /*
    - Create journal_entry table in db if 1st time
  */
  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  /*
    - insert new journal_entry into db
  */
  void saveJournalEntry({required JournalEntryDTO dto}) {
    db.transaction((txn) async {
      // Insert
      await txn.rawInsert(
          SQL_INSERT, [dto.title, dto.body, dto.rating, dto.date.toString()]);
    });
  }

  /*
    - Load journal_entries from db
  */
  Future<List<Entry>> journalEntries() async {
    // SELECT * FROM journal_entries
    final List<Map> journalRecords = await db.rawQuery(SQL_SELECT);

    // Map List<Maps> from db --> List<Entry> objects
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
