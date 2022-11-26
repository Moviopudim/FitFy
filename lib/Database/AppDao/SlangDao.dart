import 'package:Slang/Tracker/Tracker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService{
  static const String databaseName = "database.db";
  static Database? db;

  static Future<Database> initizateDb() async{
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
    await database.execute( "CREATE TABLE Tracker(id INTEGER PRIMARY KEY AUTOINCREMENT,valor DOUBLE NOT NULL, date TEXT NOT NULL)");
  }

  static Future<int> createItem(UserData userData) async {
    final db = await SqliteService.initizateDb();
    final id = await db.insert('Tracker', userData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List> getItems() async {
    final db = await SqliteService.initizateDb();

    final List<Map<String, Object?>> queryResult = await db.query('Tracker');
    return queryResult.map((e) => UserData.fromMap(e)).toList();
  }
}