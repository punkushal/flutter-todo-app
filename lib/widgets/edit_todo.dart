import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({super.key, required this.todo, required this.currentIndex});
  final Todo todo;
  final int currentIndex;
  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    return AlertDialog(
      title: const Text('Edit Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: widget.todo.title,
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: widget.todo.description,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                if (_titleController.text.trim().isEmpty) {
                  _titleController.text = widget.todo.title;
                } else if (_descriptionController.text.trim().isEmpty) {
                  _descriptionController.text = widget.todo.description;
                } else {
                  provider.updateTodo(
                    widget.currentIndex,
                    Todo(
                      title: _titleController.text.trim(),
                      description: _descriptionController.text.trim(),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ],
        )
      ],
    );
  }
}
