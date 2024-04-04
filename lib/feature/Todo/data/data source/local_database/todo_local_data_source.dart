import 'package:flutter_task_app/feature/Todo/data/model/todo_model.dart';
import 'package:hive/hive.dart';

/// Abstract class defining an interface for Todo data sources.
abstract class TodoDataSource {
  Future<void> addTodo(TodoModel todo);
  Future<void> deleteTodo(int todoModel);
  Future<List<TodoModel>> getAllTodos();
}

/// A Hive-based implementation of the [TodoDataSource] interface.
class HiveTodoDataSource implements TodoDataSource {
  final Box<TodoModel> todoBox;

  HiveTodoDataSource(this.todoBox);

  /// Adds a new [TodoModel] to the data source.
  @override
  Future<void> addTodo(TodoModel todo) async {
    await todoBox.add(todo);
  }

  /// Deletes a Todo from the data source based on the provided [todoIndex].
  @override
  Future<void> deleteTodo(int todoIndex) async {
    final keys = todoBox.keys.toList();
    final index =
        todoIndex >= 0 && todoIndex < keys.length ? keys[todoIndex] : null;
    if (index != null) {
      await todoBox.delete(index);
    } else {
      throw Exception('Invalid todo index');
    }
  }

  /// Retrieves a list of all [TodoModel] objects from the data source.
  @override
  Future<List<TodoModel>> getAllTodos() async {
    return todoBox.values.toList();
  }
}
