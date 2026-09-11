import 'package:todo_app/core/local/local_storage.dart';

import '../model/todo_model.dart';
import '../service/todo_service.dart';

class TodoRepository {
  final TodoService todoService;
  final LocalStorage localStorage;

  TodoRepository({
    required this.todoService,
    required this.localStorage,
  });

  Future<List<TodoModel>> getTodo() async {
    try {
      final todos = await todoService.getTodo();
      return todos;
    } catch (e) {
      return localStorage.getTodo();
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    try {
      await todoService.addTodo(todo);
    } catch (e) {
      await localStorage.addTodo(todo);
    }
  }

  Future<void> toggleTodo(int index) {
    return todoService.toggleTodo(index);
  }

  Future<void> deleteTodo(int index) {
    return todoService.deleteTodo(index);
  }
}
