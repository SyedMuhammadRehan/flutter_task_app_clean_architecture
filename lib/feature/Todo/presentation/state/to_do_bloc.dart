import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task_app/feature/Todo/domain/repositories/todo_repo.dart';
import 'package:flutter_task_app/feature/Todo/presentation/state/to_do_event.dart';
import 'package:flutter_task_app/feature/Todo/presentation/state/to_do_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;

  TodoBloc(this._todoRepository) : super(const TodoState()) {
    on<FetchTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  /// This event will fetch the todos from the database
  /// populate the list TodoModelEntity
  /// emit the state
  FutureOr<void> _onLoadTodos(
    FetchTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final result = await _todoRepository.getallTodo();
      result.fold(
        (failure) => emit(state.copyWith(error: failure.message)),
        (todos) => emit(state.copyWith(todosList: todos, error: '')),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// This event adds new todos to the database
  /// Then refreshes the list in the state
  FutureOr<void> _onAddTodo(
    AddTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    debugPrint("todo  ${event.todoText}");
    try {
      await _todoRepository.addTodo(text: event.todoText);

      add(FetchTodosEvent());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// This event deletes todos from the database
  /// Then refreshes the list in the state
  FutureOr<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await _todoRepository.deleteTodo(todo: event.todoIndex);

      add(FetchTodosEvent());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
