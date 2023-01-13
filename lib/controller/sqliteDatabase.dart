import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqlite {
  Database? db;


  Future<Database> checkDatabase() async {
    if (db != null) {
      return db!;
    } else {
      return await createDatabase();
    }
  }

  Future<Database> createDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path, "yash.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, username TEXT,email TEXT)";

        db.execute(query);
      },
    );
  }


  void insertData(String name , String username,String email) async {
    db = await checkDatabase();
    db!.insert("data", {"name": name, "mobile": username,"email":email});
  }

  Future<List<Map>> readData() async {
    db = await checkDatabase();
    String query = "SELECT * FROM data";
    List<Map> datalist = await db!.rawQuery(query, null);

    return datalist;
  }

  void deleteData(String id) async {
    db = await checkDatabase();
    db!.delete("data", where: "id = ?", whereArgs: [int.parse(id)]);
  }

  void updateData(String id, String name, String username,String email) async {
    db = await checkDatabase();
    db!.update("data", {"name": name, "mobile": username,"email":email},
        where: "id = ?", whereArgs: [int.parse(id)]);
  }

}
