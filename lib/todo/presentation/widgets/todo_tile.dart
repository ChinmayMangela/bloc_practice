import 'package:bloc_practice/todo/data/models/todo.dart';
import 'package:bloc_practice/todo/presentation/widgets/add_todo_dialog.dart';
import 'package:bloc_practice/todo/presentation/widgets/edit_todo_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  void _onEditPressed(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: EditTodoDialog(todo: widget.todo),
      );
    });
  }

  void _onDeletePressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: _onEditPressed,
            backgroundColor: Colors.green,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: _onDeletePressed,
            backgroundColor: Colors.red.shade900,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade200,
        ),
        child: ListTile(
          leading: Checkbox(
            value: widget.todo.isCompleted,
            onChanged: (value) {
              setState(() {
                widget.todo.isCompleted = value!;
              });
            },
          ),
          title: Text(
            widget.todo.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration:
                  widget.todo.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            widget.todo.description,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              decoration:
                  widget.todo.isCompleted ? TextDecoration.lineThrough : null,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
