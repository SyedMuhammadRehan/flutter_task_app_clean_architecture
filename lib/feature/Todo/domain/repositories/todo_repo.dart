import 'package:flutter_task_app/core/utils/typedef.dart';
import 'package:flutter_task_app/feature/Todo/domain/entity/todo_entity.dart';

/// Abstract class defining a contract for interacting with Todo data.
abstract class TodoRepository {
  const TodoRepository();

  ResultVoid addTodo({
    required String text,
  });

  ResultVoid deleteTodo({
    required int todo,
  });
  ResultFuture<List<Todo>> getallTodo();
}
