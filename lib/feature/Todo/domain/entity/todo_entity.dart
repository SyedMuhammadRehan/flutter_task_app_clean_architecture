import 'package:equatable/equatable.dart';

///Represent the core data model of the app, and define
///the structure and properties of data without any JSON methods.

class Todo extends Equatable {
  final String text;

  const Todo({required this.text});

  @override
  List<Object?> get props => [text];
}
