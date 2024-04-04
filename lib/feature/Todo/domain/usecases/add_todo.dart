import 'package:equatable/equatable.dart';
import 'package:flutter_task_app/core/usecase/usecase.dart';
import 'package:flutter_task_app/core/utils/typedef.dart';
import 'package:flutter_task_app/feature/Todo/domain/repositories/todo_repo.dart';

///  representing the parameters required for the [AddTodo] use case.
///  Use case representing the action of adding a new Todo.
class AddTodo extends UsecasewithParams<void, AddTodoParam> {
  final TodoRepository _repository;

  AddTodo(this._repository);

  @override
  ResultVoid call(AddTodoParam param) async =>
      _repository.addTodo(text: param.text);
}

class AddTodoParam extends Equatable {
  final String text;

  const AddTodoParam({required this.text});
  @override
  List<Object?> get props => [
        text,
      ];
}
