import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_icons.dart';
import 'app_typography.dart';
import 'todo_tile.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

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
                    onPressed: () {},
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
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                TodoTile(
                  title: 'Buy Groceries',
                  isDone: false,
                  onToggle: () {},
                  onDelete: () {},
                ),
                TodoTile(
                  title: 'Walk the dog',
                  isDone: false,
                  onToggle: () {},
                  onDelete: () {},
                ),
                TodoTile(
                  title: 'Prepare the slides',
                  isDone: true,
                  onToggle: () {},
                  onDelete: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
