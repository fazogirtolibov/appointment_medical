import 'package:doctor_app/data/models/notification/notification_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("notification.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: (db, ver) async {
      String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
      String textType = "TEXT";

      await db.execute('''
    CREATE TABLE $tableName (
    ${NotificationFields.id} $idType,
    ${NotificationFields.title} $textType,
    ${NotificationFields.body} $textType,
    ${NotificationFields.date} $textType
    )
    ''');
    });
  }

  LocalDatabase._init();

  static Future<NotificationModel> addNotification(
      NotificationModel notificationModel) async {
    final db = await getInstance.database;
    final id = await db.insert(tableName, notificationModel.toJson());
    return notificationModel.copyWith(id: id);
  }

  static Future<List<NotificationModel>> getAllNotifications() async {
    final db = await getInstance.database;
    final result =
        await db.query(tableName, columns: NotificationFields.values);
    return result.map((json) => NotificationModel.fromJson(json)).toList();
  }

  static Future<int> deleteAllNotification() async {
    final db = await getInstance.database;
    return await db.delete(tableName);
  }

  static Future close() async {
    final db = await getInstance.database;
    db.close();
  }
}
