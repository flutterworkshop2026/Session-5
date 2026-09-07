import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_icons.dart';
import '../../../../core/constants/theme/app_colors.dart';
import '../../../../core/constants/theme/app_typography.dart';
import '../../view_model/cubit/todo_cubit.dart';
import '../widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Tasks',
          style: AppTypography.title.copyWith(
            color: AppColors.text,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) => context
                        .read<TodoCubit>()
                        .addTodo(_controller.text.trim()),
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'What needs to be done?',
                      hintStyle: AppTypography.hint.copyWith(
                        color: AppColors.secondaryText,
                      ),
                      prefixIcon: const Icon(
                        AppIcons.edit,
                        color: AppColors.secondaryText,
                      ),
                      filled: true,
                      fillColor: AppColors.card,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 52,
                  width: 52,
                  child: FilledButton(
                    onPressed: () => context
                        .read<TodoCubit>()
                        .addTodo(_controller.text.trim()),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Icon(AppIcons.add),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
              if (state is TodoLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is TodoError) {
                return Center(child: Text(state.message));
              }
              if (state is TodoSuccess) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    return TodoTile(
                      todoModel: todo,
                      onToggle: () =>
                          context.read<TodoCubit>().toggleTodo(todo.id!),
                      onDelete: () =>
                          context.read<TodoCubit>().deleteTodo(todo.id!),
                    );
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                );
              }
              return const SizedBox();
            }),
          ),
        ],
      ),
    );
  }
}
