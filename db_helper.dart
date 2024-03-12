import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Domino {
  late int id;
  late final DateTime date;
  late final String content;

  Domino({required this.date, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(), // DateTime을 ISO 8601 형식의 문자열로 변환
      'content': content,
    };
  }
}

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'domino.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE dominos(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            date TEXT,
            content TEXT
          )
        '''); //id INTEGER PRIMARY KEY AUTOINCREMENT 는 id를 자동으로 증가시킴
      },
    );
  }

  Future<int> insertDomino(Domino domino) async {
    Database db = await database;
    return await db.insert('dominos', domino.toMap());
  }

  Future<List<Domino>> getDominos() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('dominos');
    return List.generate(maps.length, (index) {
      return Domino(
        date: DateTime.parse(maps[index]['date']), // 문자열을 DateTime으로 파싱
        content: maps[index]['content'],
      );
    });
  }

  Future<void> updateDomino(Domino domino) async {
    Database db = await database;
    await db.update(
      'dominos',
      domino.toMap(),
      where: 'id = ?',
      whereArgs: [domino.id],
    );
  }

  Future<void> deleteDomino(int id) async {
    Database db = await database;
    await db.delete(
      'dominos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
