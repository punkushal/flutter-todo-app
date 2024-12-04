import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    return ListView.builder(
      itemCount: provider.allTodos.length,
      itemBuilder: (ctx, index) => TodoItem(
        todo: provider.allTodos[index],
        index: index,
      ),
    );
  }
}
