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

class DeleteTodoRequested extends TodoEvent {
  final Todo todo;

  const DeleteTodoRequested(this.todo);

  @override
  List<Object?> get props => [todo];
}

class UpdateTodoRequested extends TodoEvent {
  final Todo newTodo;

  const UpdateTodoRequested(this.newTodo);

  @override
  List<Object?> get props => [newTodo];
}
