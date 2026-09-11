import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/api/dio_api.dart';
import 'package:todo_app/core/local/local_storage.dart';
import 'features/todo/model/model/todo_model.dart';
import 'features/todo/model/repository/todo_repository.dart';
import 'features/todo/model/service/todo_service.dart';
import 'features/todo/view/screens/todo_screen.dart';
import 'features/todo/view_model/cubit/todo_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');
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
              todoRepository: TodoRepository(
                  localStorage: LocalStorage(box: Hive.box<TodoModel>('todos')),
                  todoService: TodoService(dio: DioApi(dio: Dio()))))
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
