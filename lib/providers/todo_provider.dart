import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _allTodos = [];
  List<Todo> _filteredTodoList = [];

  List<Todo> get allTodos =>
      _filteredTodoList.isEmpty ? _allTodos : _filteredTodoList;

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

  //To search specific todo using title name
  void searchTodo(String query) {
    if (query.isNotEmpty) {
      final searchedTodos = _allTodos
          .where((todo) => todo.title.toLowerCase() == query.toLowerCase())
          .toList();
      _filteredTodoList = searchedTodos;
      notifyListeners();
    } else {
      _filteredTodoList = [];
      notifyListeners();
    }
  }
}
