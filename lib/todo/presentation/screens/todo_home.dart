import 'package:bloc_practice/todo/data/models/todo.dart';
import 'package:bloc_practice/todo/presentation/widgets/add_todo_dialog.dart';
import 'package:bloc_practice/todo/presentation/widgets/todo_list.dart';
import 'package:flutter/material.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {

  void _onFloatingButtonTap() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: AddTodoDialog(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TodoList(
        todos: [],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(onPressed: _onFloatingButtonTap, child: Text('+', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontWeight: FontWeight.w900,
    ),),);
  }
}
