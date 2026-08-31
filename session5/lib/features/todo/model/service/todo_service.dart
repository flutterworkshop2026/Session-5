import '../model/dummy_data.dart';
import '../model/todo_model.dart';

class TodoService {
  Future<List<TodoModel>> getTodo() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return DummyData.todos;
  }

  Future<void> addTodo(TodoModel todo) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return DummyData.todos.add(todo);
  }

  Future<void> toggleTodo(int index) async {
    await Future.delayed(const Duration(milliseconds: 300));
    DummyData.todos[index].isDone = !DummyData.todos[index].isDone;
  }

  Future<void> deleteTodo(int index) async {
    await Future.delayed(const Duration(milliseconds: 300));
    DummyData.todos.removeAt(index);
  }
}
