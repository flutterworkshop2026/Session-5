import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/model/todo_model.dart';
import '../../model/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({
    required this.todoRepository,
  }) : super(TodoInitial()) {
    on<GetTodos>(_getTodos);
    on<AddTodo>(_addTodo);
    on<ToggleTodo>(_toggleTodo);
    on<DeleteTodo>(_deleteTodo);
  }

  Future<void> _getTodos(
    GetTodos event,
    Emitter<TodoState> emit,
  ) async {
    try {
      emit(TodoLoading());

      final todos = await todoRepository.getTodo();

      emit(
        TodoSuccess(
          todos: todos,
        ),
      );
    } catch (e) {
      emit(
        TodoError(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _addTodo(
    AddTodo event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await todoRepository.addTodo(
        TodoModel(
          title: event.title,
        ),
      );

      final todos = await todoRepository.getTodo();

      emit(
        TodoSuccess(
          todos: todos,
        ),
      );
    } catch (e) {
      emit(
        TodoError(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _toggleTodo(
    ToggleTodo event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await todoRepository.toggleTodo(
        event.index,
      );

      final todos = await todoRepository.getTodo();

      emit(
        TodoSuccess(
          todos: todos,
        ),
      );
    } catch (e) {
      emit(
        TodoError(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _deleteTodo(
    DeleteTodo event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await todoRepository.deleteTodo(
        event.index,
      );

      final todos = await todoRepository.getTodo();

      emit(
        TodoSuccess(
          todos: todos,
        ),
      );
    } catch (e) {
      emit(
        TodoError(
          error: e.toString(),
        ),
      );
    }
  }
}
