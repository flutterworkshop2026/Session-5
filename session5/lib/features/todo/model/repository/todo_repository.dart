import '../model/todo_model.dart';
import '../service/todo_service.dart';

class TodoRepository {
  final TodoService todoService;

  TodoRepository({
    required this.todoService,
  });

  Future<List<TodoModel>> getTodo() {
    return todoService.getTodo();
  }

  Future<void> addTodo(TodoModel todo) {
    return todoService.addTodo(todo);
  }

  Future<void> toggleTodo(int index) {
    return todoService.toggleTodo(index);
  }

  Future<void> deleteTodo(int index) {
    return todoService.deleteTodo(index);
  }
}
