import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyTask {
  final int? id;
  final String? title;
  final int? boolean;

  MyTask({this.id, this.title, this.boolean});

  factory MyTask.fromMap(Map<String, dynamic> json) => new MyTask(
      id: json['id'], title: json['title'], boolean: json['boolean']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'boolean': boolean};
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'Task.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Tasks(id INTEGER PRIMARY KEY,title TEXT, boolean INTEGER)');
  }

  Future<List<MyTask>> getGroceries() async {
    Database db = await instance.database;
    var tasks = await db.query('Tasks', orderBy: 'title');
    List<MyTask> taskList =
        tasks.isNotEmpty ? tasks.map((e) => MyTask.fromMap(e)).toList() : [];
    return taskList;
  }
}
