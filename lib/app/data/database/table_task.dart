// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks/app/data/model/task.model.dart';

class TableTask {
 
  static final TableTask _instance = TableTask.internal();

  factory TableTask() => _instance;

  TableTask.internal();

  late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "todo_list.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE task("
          "id INTEGER PRIMARY KEY, "
          "title TEXT, "
          "description TEXT, "
          "isDone INTEGER)");
    });
  }

  Future<TaskModel> save(TaskModel task) async {
    Database database = await db;
    task.id = await database.insert('task', task.toMap());
    return task;
  }

  
  Future<TaskModel?> getById(int id) async {
    Database database = await db;
    List<Map<String, dynamic>> maps = await database.query('task',
      columns: ['id', 'title', 'description', 'isDone'],
      where: 'id = ?',
      whereArgs: [id]
    );

   return maps.isNotEmpty ? TaskModel.fromMap(maps.first) : null;
  }

  Future<List<TaskModel>> getAll() async {
    Database database = await db;
    List listMap = await database.rawQuery("SELECT * FROM task");
    List<TaskModel> stuffList = listMap.map((x) => TaskModel.fromMap(x)).toList();
    return stuffList;
  }

  Future<int> update(TaskModel task) async {
    Database database = await db;
    return await database.update('task', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> delete(int id) async {
    Database database = await db;
    return await database.delete('task', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    Database database = await db;
    return await database.rawDelete("DELETE * from task");
  }
}