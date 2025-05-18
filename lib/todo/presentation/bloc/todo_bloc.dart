import 'package:bloc_practice/todo/domain/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc(this.todoRepository) : super(const TodoState()) {
    on<FetchAllTodoRequested>(_onFetchAllTodos);
    on<AddTodoRequested>(_onAddTodo);
    on<RemoveTodoRequested>(_onRemoveTodo);
    on<UpdateTodoRequested>(_onUpdateTodo);
    on<ToggleTodoCompletedRequested>(_onToggleTodoCompleted);
  }

  Future<void> _onFetchAllTodos(FetchAllTodoRequested event, Emitter<TodoState> emit) async {
    emit(state.copyWith(isLoading: true));
    final todos = await todoRepository.fetchAllTodo();
    emit(state.copyWith(todos: todos, isLoading: false));
  }

  Future<void> _onAddTodo(AddTodoRequested event, Emitter<TodoState> emit) async {
    await todoRepository.addTodo(event.todo);
    add(FetchAllTodoRequested());
  }

  Future<void> _onRemoveTodo(RemoveTodoRequested event, Emitter<TodoState> emit) async {
    await todoRepository.removeTodo(event.todoId);
    add(FetchAllTodoRequested());
  }

  Future<void> _onUpdateTodo(UpdateTodoRequested event, Emitter<TodoState> emit) async {
    await todoRepository.updateTodo(event.newTodo);
    add(FetchAllTodoRequested());
  }

  Future<void> _onToggleTodoCompleted(ToggleTodoCompletedRequested event, Emitter<TodoState> emit) async {
    final todo = state.todos.firstWhere((todo) => todo.id == event.todoId);
    todo.copyWith(isCompleted: !todo.isCompleted);
    await todoRepository.updateTodo(todo);
    add(FetchAllTodoRequested());
  }
}
