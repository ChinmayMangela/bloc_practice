import 'package:bloc_practice/todo/data/models/todo.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18)
      ),
      child: ListTile(
        leading: Checkbox(value: widget.todo.isCompleted, onChanged: (value) {
          setState(() {
            widget.todo.isCompleted = value!;
          });
        }),
        title: Text(widget.todo.title),
        subtitle: Text(widget.todo.description),
      ),
    );
  }
}
