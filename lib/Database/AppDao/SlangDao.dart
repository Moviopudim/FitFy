import 'package:Slang/Tracker/Tracker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService{
  static const String databaseName = "tracker.db";
  static Database? db;


  static Future<Database> initializeDB() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return db?? await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await createTables(db);
        });
  }

  static Future<void> createTables(Database database) async{
    await database.execute(trackerTable);
  }

  static const trackerTable = """
      CREATE TABLE IF NOT EXISTS tracker 
      (
      Id TEXT NOT NULL,
      date TEXT, 
      valor TEXT
      )
  """;

  static Future<int> createItem(UserData userData) async {
    final db = await SqliteService.initializeDB();

    final id = await db.insert('tracker', userData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return id;
  }

  static Future<List<UserData>> getItems() async {
    final db = await SqliteService.initializeDB();

    final List<Map<String, Object?>> queryResult = await db.query('tracker');
    return queryResult.map((e) => UserData.fromMap(e)).toList();
  }

  static Future<Database> initDB() async {
    final String DBpath = await getDatabasesPath();
    final path = join(DBpath, databaseName);
    return db?? await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(trackerTable);
        });
  }
}