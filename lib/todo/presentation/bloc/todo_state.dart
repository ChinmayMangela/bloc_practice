

import 'package:equatable/equatable.dart';

import '../../data/models/todo.dart';

abstract class TodoState extends Equatable {}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);

  @override
  List<Object> get props => [todos];

}

class TodoError extends TodoState {
  final String errorMessage;

  TodoError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

}