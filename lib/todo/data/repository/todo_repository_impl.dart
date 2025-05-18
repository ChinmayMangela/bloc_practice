import 'package:bloc_practice/todo/data/local/todo_local_data_source.dart';
import 'package:bloc_practice/todo/data/models/todo.dart';
import 'package:bloc_practice/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoLocalDataSource _todoLocalDataSource;

  TodoRepositoryImpl({required TodoLocalDataSource todoLocalDataSource})
    : _todoLocalDataSource = todoLocalDataSource;

  @override
  Future<void> addTodo(Todo todo) async {
    await _todoLocalDataSource.addTodo(todo);
  }

  @override
  Future<List<Todo>> fetchAllTodo() async {
    return await _todoLocalDataSource.fetchAllTodo();
  }

  @override
  Future<void> removeTodo(String todoId) async {
    await _todoLocalDataSource.removeTodo(todoId);
  }

  @override
  Future<void> updateTodo(Todo newTodo) async {
    await _todoLocalDataSource.updateTodo(newTodo);
  }

}
