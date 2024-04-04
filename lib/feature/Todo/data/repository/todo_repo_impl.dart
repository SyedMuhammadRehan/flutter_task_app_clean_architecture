import 'package:dartz/dartz.dart';
import 'package:flutter_task_app/core/errors/failure.dart';
import 'package:flutter_task_app/core/utils/typedef.dart';
import 'package:flutter_task_app/feature/Todo/data/data%20source/local_database/todo_local_data_source.dart';
import 'package:flutter_task_app/feature/Todo/data/model/todo_model.dart';
import 'package:flutter_task_app/feature/Todo/domain/entity/todo_entity.dart';
import 'package:flutter_task_app/feature/Todo/domain/repositories/todo_repo.dart';

/// Implementation of the [TodoRepository] interface, responsible for interacting
/// with the local data source.
class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  ResultVoid addTodo({
    required String text,
  }) async {
    final todoModel = TodoModel(text: text);
    try {
      await localDataSource.addTodo(todoModel);
      return const Right(null); // Success
    } catch (e) {
      return const Left(Failure(message: 'Failed to add todo')); // Failure
    }
  }

  @override
  ResultFuture<List<Todo>> getallTodo() async {
    try {
      final todoModels = await localDataSource.getAllTodos();
      final todos = todoModels.map((model) => Todo(text: model.text)).toList();
      return Right(todos); // Success
    } catch (e) {
      return const Left(Failure(message: 'Failed to fetch todos')); // Failure
    }
  }

  @override
  ResultVoid deleteTodo({required int todo}) async {
    try {
      await localDataSource.deleteTodo(todo); // Mapping

      return const Right(null); // Success
    } catch (e) {
      return const Left(Failure(message: 'Failed to delete todo')); // Failure
    }
  }
}
