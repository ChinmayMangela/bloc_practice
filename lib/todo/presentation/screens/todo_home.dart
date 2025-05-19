import 'package:bloc_practice/todo/presentation/bloc/todo_bloc.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_event.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_state.dart';
import 'package:bloc_practice/todo/presentation/widgets/add_todo_dialog.dart';
import 'package:bloc_practice/todo/presentation/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(FetchAllTodoRequested());
  }
  void _onFloatingButtonTap() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: AddTodoDialog());
      },
    );
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
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return TodoList(todos: state.todos);
          }
        },
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _onFloatingButtonTap,
      child: Text(
        '+',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w900),
      ),
    );
  }
}
