

import 'package:bloc_practice/todo/data/models/todo.dart';

abstract class TodoRepository {
  Future<void> addTodo(Todo todo);
  Future<void> removeTodo(Todo todo);
  Future<void> updateTodo(String oldTodoId, Todo newTodo);
  Future<List<Todo>> fetchAllTodo();
}