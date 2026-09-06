import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/model/todo_model.dart';
import '../../model/repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository todoRepository;
  TodoCubit({required this.todoRepository}) : super(TodoInitial());
  Future<void> getTodo() async {
    try {
      emit(TodoLoading());
      final todos = await todoRepository.getTodo();
      emit(TodoSuccess(todos: todos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }

  Future<void> addTodo(String title) async {
    try {
      await todoRepository.addTodo(TodoModel(title: title));
      final todos = await todoRepository.getTodo();
      emit(TodoSuccess(todos: todos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }

  Future<void> toggleTodo(int index) async {
    try {
      await todoRepository.toggleTodo(index);
      final todos = await todoRepository.getTodo();
      emit(TodoSuccess(todos: todos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }

  Future<void> deleteTodo(int index) async {
    try {
      await todoRepository.deleteTodo(index);
      final todos = await todoRepository.getTodo();
      emit(TodoSuccess(todos: todos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }
}
