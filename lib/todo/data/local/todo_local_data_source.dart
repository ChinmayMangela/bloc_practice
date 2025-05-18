

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/todo.dart';

class TodoLocalDataSource {
  const TodoLocalDataSource();

  static Future<void> initHive() async {
    final appDocumentDirectory = await getApplicationCacheDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  static void openBox() {
    Hive.registerAdapter(TodoAdapter());
    Hive.openBox<Todo>('todos');
  }

  Future<void> addTodo(Todo todo) async {
    final box = Hive.box('todos');
    await box.add(todo);
  }

  Future<void> removeTodo(Todo todo) async {
    final box = Hive.box('todos');
    await box.delete(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    final box = Hive.box('todos');
    await box.put(todo.id, todo);
  }

  Future<List<Todo>> fetchAllTodo() async {
    final box = Hive.box('todos');
    return box.values.toList() as List<Todo>;
  }

}