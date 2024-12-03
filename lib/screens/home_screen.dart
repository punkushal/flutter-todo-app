import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_new_todo_screen.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Todo'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Expanded(
            child: TodoList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const AddNewTodoScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
