import 'package:flutter/material.dart';

import '../../../../core/app_icons.dart';
import '../../../../core/constants/theme/app_colors.dart';
import '../../../../core/constants/theme/app_typography.dart';
import '../../model/model/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todoModel;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoTile({
    super.key,
    required this.todoModel,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      color: todoModel.isDone ? AppColors.background : AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Checkbox(
          value: todoModel.isDone,
          onChanged: (_) => onToggle(),
          activeColor: AppColors.primary,
        ),
        title: Text(
          todoModel.title,
          style: AppTypography.todo.copyWith(
            color: todoModel.isDone ? AppColors.secondaryText : AppColors.text,
            decoration: todoModel.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(AppIcons.delete),
          color: AppColors.delete,
          onPressed: onDelete,
        ),
      ),
    );
  }
}
