import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_api.dart';
import '../model/todo_model.dart';

class TodoService {
  final DioApi dio;
  TodoService({required this.dio});
  Future<List<TodoModel>> getTodo() async {
    final response =
        await dio.get('${ApiConstants.baseUrl}${ApiConstants.todos}');
    final data = response['data'] as List;
    return data.map((json) => TodoModel.fromJson(json)).toList();
  }

  Future<void> addTodo(TodoModel todo) async {
    await dio.post('${ApiConstants.baseUrl}${ApiConstants.todos}', body: {
      'title': todo.title,
      'completed': todo.isDone,
    });
  }

  Future<void> toggleTodo(int index) async {
    final todos = await getTodo();
    final todo = todos.firstWhere(
      (todo) => todo.id == index,
      orElse: () => throw Exception('todo with id $index not found'),
    );
    await dio
        .patch('${ApiConstants.baseUrl}${ApiConstants.todos}/$index', body: {
      'completed': !todo.isDone,
    });
  }

  Future<void> deleteTodo(int index) async {
    await dio.delete('${ApiConstants.baseUrl}${ApiConstants.todos}/$index');
  }
}
