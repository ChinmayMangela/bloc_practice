import 'package:bloc_practice/todo/data/exceptions/todo_data_source_exception.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import '../models/todo.dart';

class TodoLocalDataSource {
  const TodoLocalDataSource();

  static final _boxName = 'todos';

  static Box<Todo>? _box;

  static Future<void> initHive() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(directory.path);
      Hive.registerAdapter(TodoAdapter());
      _box = await Hive.openBox(_boxName);
    } catch (e) {
      throw TodoDataSourceException('Failed to initialize hive ', e);
    }
  }

  Box<Todo> _getBox() {
    if (_box == null || !_box!.isOpen) {
      throw StateError('Hive box "$_boxName is not open. Ensure init');
    }
    return _box!;
  }

  Future<void> addTodo(Todo todo) async {
    try {
      final box = _getBox();
      await box.put(todo.id, todo);
    } on HiveError catch (e) {
      throw TodoDataSourceException('Failed to add todo', e);
    } catch (e) {
      throw TodoDataSourceException(
        'An unexpected error occurred while adding todo ${todo.title}',
        e,
      );
    }
  }

  Future<void> removeTodo(String todoId) async {
    try {
      final box = _getBox();
      if(!box.containsKey(todoId)) {
        throw TodoDataSourceException('Todo with $todoId not found, cannot delete');
      }
      await box.delete(todoId);
    } on HiveError catch (e) {
      throw TodoDataSourceException('Failed to remove todo', e);
    } catch (e) {
      throw TodoDataSourceException('An Unexpected error occurred while removing todo $todoId', e);
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      final box = _getBox();
      box.put(todo.id, todo);
    } on HiveError catch (e) {
      throw TodoDataSourceException('Failed to update todo', e);
    } catch (e) {
      throw TodoDataSourceException('An Unexpected error occurred while updating todo ${todo.title}', e);
    }
  }

  Future<List<Todo>> fetchAllTodo() async {
    try {
      final box = _getBox();
      return box.values.toList();
    } on HiveError catch (e) {
      throw TodoDataSourceException('Failed to fetch all todo', e);
    } catch (e) {
      throw TodoDataSourceException('An Unexpected error occurred while fetching todos', e);
    }
  }

  static Future<void> closeHive() async {
    try {
      await _box?.close();
    } catch (e) {
      print("Error closing Hive box: $e");
    }
  }
}
