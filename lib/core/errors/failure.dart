import 'package:equatable/equatable.dart';

/// Represents a generic application failure.
class Failure extends Equatable {
  final String message;

  const Failure({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
