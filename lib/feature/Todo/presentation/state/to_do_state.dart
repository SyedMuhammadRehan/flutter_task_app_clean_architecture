import 'package:equatable/equatable.dart';
import 'package:flutter_task_app/feature/Todo/domain/entity/todo_entity.dart';

class TodoState extends Equatable {
  final bool showLoading;
  final List<Todo> todos;
  final String errorMessage;

  const TodoState({
    this.todos = const [],
    this.errorMessage = '',
    this.showLoading = false,
  });

  TodoState copyWith({
    List<Todo>? todosList,
    String? error,
    bool? loading,
  }) {
    return TodoState(
      todos: todosList ?? todos,
      errorMessage: error ?? errorMessage,
      showLoading: loading ?? showLoading,
    );
  }

  @override
  List<Object> get props => [
        todos,
        errorMessage,
        showLoading,
      ];
}
