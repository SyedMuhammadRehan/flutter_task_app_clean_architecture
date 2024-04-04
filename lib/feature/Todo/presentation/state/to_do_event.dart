import 'package:equatable/equatable.dart';

// Events
abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class FetchTodosEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final String todoText;
  const AddTodoEvent(this.todoText);
  @override
  List<Object> get props => [todoText];
}

class DeleteTodoEvent extends TodoEvent {
  final int todoIndex;
  const DeleteTodoEvent(this.todoIndex);
  @override
  List<Object> get props => [todoIndex];
}
