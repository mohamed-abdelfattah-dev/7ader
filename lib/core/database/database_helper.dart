import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  // In-memory fallback for Web testing
  static final List<Map<String, dynamic>> _webMockUsers = [];

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (kIsWeb) return null; // No sqflite on web
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database?> _initDatabase() async {
    if (kIsWeb) return null;
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'alatareq.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT UNIQUE,
        phone TEXT,
        password TEXT
      )
    ''');
  }

  // Insert User (Signup)
  Future<int> registerUser(Map<String, dynamic> user) async {
    if (kIsWeb) {
      // Simulate registration for web
      if (_webMockUsers.any((u) => u['email'] == user['email'])) {
        return -1; // Duplicate email simulation
      }
      _webMockUsers.add(user);
      return _webMockUsers.length;
    }

    final db = await database;
    if (db == null) return -1;

    try {
      return await db.insert('users', user);
    } catch (e) {
      debugPrint("Error inserting user: $e");
      return -1;
    }
  }

  // Get User (Login)
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    if (kIsWeb) {
      // Look for user in memory
      try {
        return _webMockUsers.firstWhere(
          (u) => u['email'] == email && u['password'] == password,
        );
      } catch (e) {
        return null; // Not found
      }
    }

    final db = await database;
    if (db == null) return null;

    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }
}
