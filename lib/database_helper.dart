import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final String tableMonths = 'months';
final String monthId = '_id';
final String monthName = 'name';

// data model class
class Month {

  int id;
  String name;

  Month();

  // convenience constructor to create a User object
  Month.fromMap(Map<String, dynamic> map) {
    id = map[monthId];
    name = map[monthName];
  }

  // convenience method to create a Map from this User object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      monthName: name,
    };
    if (id != null) {
      map[monthId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {

  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "home_budget.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database, can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableMonths(
            $monthId INTEGER PRIMARY KEY,
            $monthName TEXT NOT NULL
          )
          ''');
  }

  // Database helper methods:
  Future<int> insert(Month month) async {
    Database db = await database;
    int id = await db.insert(tableMonths, month.toMap());
    return id;
  }

  Future<Month> queryUser(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableMonths,
        columns: [monthId, monthName],
        where: '$monthId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Month.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Month>> queryAllMonths() async {
    Database db = await database;
    List<Map> maps = await db.query(tableMonths);
    if (maps.length > 0) {
      List<Month> months = [];
      maps.forEach((map) => months.add(Month.fromMap(map)));
      return months;
    }
    return null;
  }

  Future<int> deleteUser(int id) async {
    Database db = await database;
    return await db.delete(tableMonths, where: '$monthId = ?', whereArgs: [id]);
  }

  Future<int> update(Month month) async {
    Database db = await database;
    return await db.update(tableMonths, month.toMap(),
        where: '$monthId = ?', whereArgs: [month.id]);
  }

}
