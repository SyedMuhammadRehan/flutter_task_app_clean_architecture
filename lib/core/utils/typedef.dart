import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

/// A type alias representing a future that either resolves with a [Failure] (in case of an error)
/// or a value of type [T].
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// A type alias representing a future that resolves either with a [Failure] (in case of an error)
/// or indicates success (void).

typedef ResultVoid = ResultFuture<void>;
