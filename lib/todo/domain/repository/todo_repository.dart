

import 'package:bloc_practice/todo/data/models/todo.dart';

abstract class TodoRepository {
  Future<void> addTodo(Todo todo);
  Future<void> removeTodo(String todoId);
  Future<void> updateTodo(Todo newTodo);
  Future<List<Todo>> fetchAllTodo();
}