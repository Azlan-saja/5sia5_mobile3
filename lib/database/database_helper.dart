import 'package:aplikasi_5sia5_mobile3/models/node_model.dart';
import 'package:aplikasi_5sia5_mobile3/models/user_model.dart';
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
  INSERT INTO users (userId, userName, userPassword) 
    values (1, 'admin', '1234')
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

  Future<bool> login(UserModel user) async {
    final db = await database;

    final result = await db.query(
      'users',
      where: 'userName = ? AND userPassword = ?',
      whereArgs: [user.userName, user.userPassword],
    );

    return result.isNotEmpty;
  }

  Future<int> createNote(NoteModel note) async {
    final Database db = await database;

    return db.insert('notes', note.toMap());
  }

  Future<List<NoteModel>> getNotes() async {
    final db = await database;
    final result = await db.query('notes');

    return result.map((e) => NoteModel.fromMap(e)).toList();
  }
}
