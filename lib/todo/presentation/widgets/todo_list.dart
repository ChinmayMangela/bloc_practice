import 'package:bloc_practice/todo/data/models/todo.dart';
import 'package:bloc_practice/todo/presentation/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoTile(todo: todos[index]);
      },
      itemCount: todos.length,
    );
  }
}
