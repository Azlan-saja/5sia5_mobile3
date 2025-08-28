import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  // Configuration variables
  static Database? _database;
  final String databaseName = "note.db";
  final int databaseVersion = 1;

  // Create user table
  final String createUserTable = '''
  CREATE TABLE users (
    userId INTEGER PRIMARY KEY AUTOINCREMENT,
    userName TEXT UNIQUE NOT NULL,
    userPassword TEXT NOT NULL
  )
  ''';

  // create note table
  final String createNoteTable = '''
  CREATE TABLE notes (
    noteId INTEGER PRIMARY KEY AUTOINCREMENT,
    noteTitle TEXT NOT NULL,
    noteContent TEXT NOT NULL,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP
  )
  ''';

  // create note table
  final String insertUserTable = '''
  Insert INTO user (userId, userName, userPassword) 
    value (1, 'admin', '1234')
  ''';

  // Initialize the database
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(
      path,
      version: databaseVersion,
      onCreate: (db, version) async {
        await db.execute(createUserTable);
        await db.execute(createNoteTable);
        await db.execute(insertUserTable);
      },
    );
  }

  // Getter database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }
}
