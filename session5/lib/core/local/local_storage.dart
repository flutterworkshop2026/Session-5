import 'package:hive_flutter/hive_flutter.dart';

import '../../features/todo/model/model/todo_model.dart';

class LocalStorage {
  final Box<TodoModel> box;

  LocalStorage({required this.box});
  List<TodoModel> getTodo() {
    return box.values.toList();
  }

  Future<void> addTodo(TodoModel todo) async {
    await box.add(todo);
  }
}
