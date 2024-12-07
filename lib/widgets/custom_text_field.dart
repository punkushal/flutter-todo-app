import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.vertical,
    required this.horizontal,
    this.controller,
    this.labelText,
    this.border,
    this.prefixIcon,
  });

  final double vertical;
  final double horizontal;
  final TextEditingController? controller;
  final String? labelText;
  final InputBorder? border;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: labelText,
          border: border,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 222, 118, 53)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onSubmitted: (value) {
          provider.searchTodo(value);
        },
      ),
    );
  }
}
