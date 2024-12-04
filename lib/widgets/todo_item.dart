import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/edit_todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, required this.index});
  final Todo todo;
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    int currentValue = 0;
    return Card(
      elevation: 1.0,
      color: Theme.of(context).cardColor,
      shadowColor: Colors.grey.shade400,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            width: 0.8, color: Theme.of(context).colorScheme.onPrimary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Text(todo.title),
        trailing: PopupMenuButton(
          icon: const Icon(
              Icons.more_vert), // This is the icon for the pop-up menu
          onSelected: (value) {
            currentValue = value;

            // Handle selection
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: currentValue,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => EditTodo(
                      todo: todo,
                      currentIndex: index,
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ),
            PopupMenuItem(
              value: currentValue,
              child: IconButton(
                onPressed: () {
                  provider.deleteTodo(todo.id);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
