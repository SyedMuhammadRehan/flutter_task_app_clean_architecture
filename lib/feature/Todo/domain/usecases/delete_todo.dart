import 'package:equatable/equatable.dart';
import 'package:flutter_task_app/core/usecase/usecase.dart';
import 'package:flutter_task_app/core/utils/typedef.dart';

import 'package:flutter_task_app/feature/Todo/domain/repositories/todo_repo.dart';

///  representing the parameters required for the [DeleteTodo] use case.
///  Use case representing the action of deleting a Todo.
class DeleteTodo extends UsecasewithParams<void, DeleteTodoParam> {
  final TodoRepository _repository;

  DeleteTodo(this._repository);

  @override
  ResultVoid call(DeleteTodoParam param) async =>
      _repository.deleteTodo(todo: param.todoindex);
}

class DeleteTodoParam extends Equatable {
  final int todoindex;

  const DeleteTodoParam({required this.todoindex});

  @override
  List<Object?> get props => [todoindex];
}
