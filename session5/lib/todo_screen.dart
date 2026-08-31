import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_icons.dart';
import 'app_typography.dart';
import 'todo_tile.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> todos = [
    {'title': 'Buy Groceries', 'isDone': false},
    {'title': 'Buy Groceries', 'isDone': false},
    {'title': 'Buy Groceries', 'isDone': true},
    {'title': 'Buy Groceries', 'isDone': false},
  ];
  void addTodo() {
    setState(() {
      todos.add({'title': _controller.text.trim(), 'isDone': false});
    });
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void toggleTodo(int index) {
    setState(() {
      todos[index]['isDone'] = !todos[index]['isDone'];
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    onSubmitted: (value) => addTodo(),
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
                    onPressed: addTodo,
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
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return TodoTile(
                  title: todo['title'],
                  isDone: todo['isDone'],
                  onToggle: () => toggleTodo(index),
                  onDelete: () => deleteTodo(index),
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
