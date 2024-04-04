// import 'package:flutter/material.dart';
// import 'package:flutter_task_app/feature/Todo/data/data%20source/local_database/todo_local_data_source.dart';
// import 'package:flutter_task_app/feature/Todo/data/repository/todo_repo_impl.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:flutter_task_app/feature/Todo/data/model/todo_model.dart';

// import 'package:dartz/dartz.dart';
// import 'package:flutter_task_app/feature/Todo/domain/entity/todo_entity.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mockito/mockito.dart';

// // Mock TodoDataSource for testing
// class MockTodoDataSource extends Mock implements TodoDataSource {}

// void main() {
//   group('TodoRepositoryImpl tests', () {
//     late TodoRepositoryImpl todoRepository;
//     late TodoDataSource mockDataSource;

//     setUp(() async {
//       WidgetsFlutterBinding.ensureInitialized();
//       final appDocumentDir =
//           await path_provider.getApplicationDocumentsDirectory();
//       Hive.init(appDocumentDir.path);
//       Hive.registerAdapter(TodoModelAdapter());
//       // Open Hive boxes
//       await Hive.openBox<TodoModel>('todos');
//        when(mockPathProvider.getApplicationDocumentsDirectory())
//       .thenAnswer((_) async => Directory('test/app_dir')); 

//   // Create MockTodoDataSource with the mocked path_provider
//   mockDataSource = MockTodoDataSource(mockPathProvider);
//   todoRepository = TodoRepositoryImpl(mockDataSource);
//       mockDataSource = MockTodoDataSource();
//       todoRepository = TodoRepositoryImpl(mockDataSource);
//     });

//     test('addTodo should add todo successfully', () async {
//       // Arrange
//       const todoText = 'Test todo';
//       final todoModel = TodoModel(text: todoText);

//       // Stub the addTodo method of mockDataSource to return a Right value
//       when(mockDataSource.addTodo(todoModel)).thenAnswer((_) async {});

//       // Act
//       final result = await todoRepository.addTodo(text: todoText);

//       // Assert
//       expect(result, const Right(null));
//     });

//     test('deleteTodo should delete todo successfully', () async {
//       // Arrange
//       const todoId = 1;

//       // Stub the deleteTodo method of mockDataSource to return a Right value
//       when(mockDataSource.deleteTodo(todoId)).thenAnswer((_) async {});

//       // Act
//       final result = await todoRepository.deleteTodo(id: todoId);

//       // Assert
//       expect(result, const Right(null));
//     });

//     test('getallTodo should return list of todos successfully', () async {
//       // Arrange
//       final todoModels = [TodoModel(text: 'Todo 1'), TodoModel(text: 'Todo 2')];

//       // Stub the getAllTodos method of mockDataSource to return a list of todo models
//       when(mockDataSource.getAllTodos()).thenAnswer((_) async => todoModels);

//       // Act
//       final result = await todoRepository.getallTodo();

//       // Assert
//       expect(result,
//           Right(todoModels.map((model) => Todo(text: model.text)).toList()));
//     });
//   });
// }
