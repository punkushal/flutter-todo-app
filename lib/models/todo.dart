import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  final String title;
  final String description;
  final String id;

  Todo({
    required this.title,
    required this.description,
  }) : id = uuid.v4();
}
