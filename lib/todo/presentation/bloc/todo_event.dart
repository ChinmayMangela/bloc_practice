import 'package:bloc_practice/todo/data/models/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class AddTodoRequested extends TodoEvent {
  final Todo todo;

  const AddTodoRequested(this.todo);

  @override
  List<Object?> get props => [todo];
}

class RemoveTodoRequested extends TodoEvent {
  final String todoId;

  const RemoveTodoRequested(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class UpdateTodoRequested extends TodoEvent {
  final Todo newTodo;

  const UpdateTodoRequested(this.newTodo);

  @override
  List<Object?> get props => [newTodo];
}

class FetchAllTodoRequested extends TodoEvent {

  const FetchAllTodoRequested();

  @override
  List<Object?> get props => [];
}

class ToggleTodoCompletedRequested extends TodoEvent {
  final String todoId;

  const ToggleTodoCompletedRequested(this.todoId);

  @override
  List<Object?> get props => [todoId];

}