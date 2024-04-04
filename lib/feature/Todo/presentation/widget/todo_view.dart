import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_app/feature/Todo/presentation/state/to_do_bloc.dart';
import 'package:flutter_task_app/feature/Todo/presentation/state/to_do_event.dart';
import 'package:flutter_task_app/feature/Todo/presentation/state/to_do_state.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  void initState() {
    /// fetch the todos list
    context.read<TodoBloc>().add(FetchTodosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.showLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.errorMessage.isNotEmpty) {
            return const Center(child: Text('Error loading todos'));
          }
          return state.todos.isEmpty
              ? const Center(
                  child: Text('No todos yet.'),
                )
              : ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: state
                      .todos.length, // Access 'todos' from TodosLoadedState
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Text(state.todos[index].text), // Access text property
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          BlocProvider.of<TodoBloc>(context)
                              .add(DeleteTodoEvent(index));
                        },
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String newTodoText = '';
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              // Initialize text input value
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          newTodoText = value; // Update text input value
                        },
                        decoration:
                            const InputDecoration(hintText: 'Enter Task'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.5)),
                        onPressed: () {
                          if (newTodoText.isNotEmpty) {
                            BlocProvider.of<TodoBloc>(context)
                                .add(AddTodoEvent(newTodoText));
                          }
                          Navigator.of(context).pop(); // Close the bottom sheet
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
