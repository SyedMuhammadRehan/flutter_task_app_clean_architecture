import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_app/di_container.dart';
import 'package:flutter_task_app/feature/Todo/domain/repositories/todo_repo.dart';
import 'package:flutter_task_app/feature/Todo/presentation/state/to_do_bloc.dart';
import 'package:flutter_task_app/feature/Todo/presentation/widget/todo_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TodoBloc(sl.get<TodoRepository>())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ' Task Manager App',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
          ),
          home: const ToDoScreen(),
        ));
  }
}
