import 'package:flutter_task_app/feature/Todo/data/data%20source/local_database/todo_local_data_source.dart';
import 'package:flutter_task_app/feature/Todo/data/model/todo_model.dart';
import 'package:flutter_task_app/feature/Todo/data/repository/todo_repo_impl.dart';
import 'package:flutter_task_app/feature/Todo/domain/repositories/todo_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialization of Hive
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');

  // Repository
  sl.registerLazySingleton<TodoDataSource>(
      () => HiveTodoDataSource(Hive.box<TodoModel>('todos')));
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
}
