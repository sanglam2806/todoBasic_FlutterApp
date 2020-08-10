import 'package:sqlite_fullter_app/utils/database_creator.dart';

class Todo {
  int id;
  String name;
  String info;
  bool isDelete;

  Todo(
    this.id,
    this.name,
    this.info,
    this.isDelete,
  );

  Todo.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.name = json[DatabaseCreator.name];
    this.info = json[DatabaseCreator.info];
    this.isDelete = json[DatabaseCreator.isDelete] == 1;
  }
}
