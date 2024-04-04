import 'package:flutter/material.dart';
import 'package:flutter_task_app/feature/Todo/data/data%20source/local_database/todo_local_data_source.dart';
import 'package:flutter_task_app/feature/Todo/data/repository/todo_repo_impl.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_task_app/feature/Todo/data/model/todo_model.dart';

import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';

// Mock TodoDataSource for testing
class MockTodoDataSource extends Mock implements TodoDataSource {}

void main() {
  group('TodoRepositoryImpl tests', () {
    late TodoRepositoryImpl todoRepository;
    late TodoDataSource mockDataSource;

    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();
      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
      Hive.registerAdapter(TodoModelAdapter());
      // Open Hive boxes
      await Hive.openBox<TodoModel>('todos');

      // Create MockTodoDataSource with the mocked path_provider

      mockDataSource = MockTodoDataSource();
      todoRepository = TodoRepositoryImpl(mockDataSource);
    });

    test('addTodo should add todo successfully', () async {
      // Arrange
      const todoText = 'Test todo';
      final todoModel = TodoModel(text: todoText);

      // Stub the addTodo method of mockDataSource to return a Right value
      when(mockDataSource.addTodo(todoModel)).thenAnswer((_) async {});

      // Act
      final result = await todoRepository.addTodo(text: todoText);

      // Assert
      expect(result, const Right(null));
    });
  });
}
