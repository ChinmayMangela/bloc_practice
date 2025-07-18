import 'package:bloc_practice/todo/data/models/todo.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_bloc.dart';
import 'package:bloc_practice/todo/presentation/bloc/todo_event.dart';
import 'package:bloc_practice/todo/presentation/widgets/todo_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  void _onSaveTap() {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text.trim();
      final description = _descriptionController.text.trim();
      final newTodo = Todo(
        title: title,
        description: description,
        createdAt: DateTime.now(),
      );
      context.read<TodoBloc>().add(AddTodoRequested(newTodo));
      print(newTodo.toString());
      Navigator.of(context).pop();
    }
  }

  String? _titleValidator(String? title) {
    if (title == null || title.isEmpty) {
      return 'Title cannot be empty';
    }

    if (title.length < 5 || title.length > 18) {
      return 'Title must be between 5 and 18 characters';
    }

    return null;
  }

  String? _descriptionValidator(String? description) {
    if (description == null || description.isEmpty) {
      return 'Description cannot be empty';
    }

    if (description.length < 10 || description.length > 100) {
      return 'Description must be between 10 and 100 characters';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TodoInputField(
              controller: _titleController,
              hintText: 'Title',
              validator: _titleValidator,
            ),
            SizedBox(height: 10),
            TodoInputField(
              controller: _descriptionController,
              hintText: 'Description',
              validator: _descriptionValidator,
            ),
            SizedBox(height: 10),
            _buildButtonsRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(onPressed: _onSaveTap, child: Text('Save')),
      ],
    );
  }
}
