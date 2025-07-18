import 'package:bloc_practice/authentication/presentation/bloc/auth_state.dart';
import 'package:bloc_practice/main.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_bloc.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_event.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_state.dart';
import 'package:bloc_practice/todo/presentation/widgets/add_todo_dialog.dart';
import 'package:bloc_practice/todo/presentation/widgets/todo_list.dart';
import 'package:bloc_practice/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/presentation/bloc/auth_bloc.dart';
import '../../../authentication/presentation/bloc/auth_event.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
          floatingActionButton: _buildFloatingActionButton(),
        );
      },
      listener: (context, state) {
        if (state is AuthFailure) {
          Utils.showSnackBar(state.message);
        } else if (state is AuthSignedOut) {
          navigatorKey.currentState!.pushReplacementNamed('/signIn');
        }
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Todo App'),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            context.read<AuthBloc>().add(AuthSignOutRequested());
          },
          icon: Icon(Icons.logout),
        ),
      ],
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
            return state.todos.isEmpty
                ? Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'No todos found\n click on floating action button to add a new todo',
                  ),
                )
                : TodoList(todos: state.todos);
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
