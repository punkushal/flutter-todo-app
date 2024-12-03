import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _allTodos = [];

  List<Todo> get allTodos => _allTodos;

  //To add new todo
  void addNewTodo(Todo todo) {
    _allTodos.add(todo);
    notifyListeners();
  }

  //To delete existing todo
  void deleteTodo(String id) {
    _allTodos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  //To update existed todo
  void updateTodo(int index, Todo newTodo) {
    allTodos[index] = newTodo;
    notifyListeners();
  }
}
