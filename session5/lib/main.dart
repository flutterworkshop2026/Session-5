import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/view_model/cubit/todo_cubit.dart';
import 'package:todo_app/features/todo/model/repository/todo_repository.dart';
import 'package:todo_app/features/todo/model/service/todo_service.dart';
import 'features/todo/view/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodoCubit(todoRepository: TodoRepository(todoService: TodoService()))
            ..getTodo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}
