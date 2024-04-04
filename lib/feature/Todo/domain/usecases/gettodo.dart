import 'package:flutter_task_app/core/usecase/usecase.dart';
import 'package:flutter_task_app/core/utils/typedef.dart';
import 'package:flutter_task_app/feature/Todo/domain/entity/todo_entity.dart';

import 'package:flutter_task_app/feature/Todo/domain/repositories/todo_repo.dart';

/// Use case representing the action of retrieving all Todos.
class GetTodo extends UsecasewithoutParams<List<Todo>> {
  final TodoRepository _repository;

  GetTodo(this._repository);
  @override
  ResultFuture<List<Todo>> call() async => await _repository.getallTodo();
}
