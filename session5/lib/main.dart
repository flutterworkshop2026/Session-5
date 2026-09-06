import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/todo/model/repository/todo_repository.dart';
import 'features/todo/model/service/todo_service.dart';
import 'features/todo/view/screens/todo_screen.dart';
import 'features/todo/view_model/cubit/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoCubit(
              todoRepository: TodoRepository(todoService: TodoService()))
            ..getTodo(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}
