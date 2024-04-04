import 'package:flutter_task_app/core/utils/typedef.dart';

/// Abstract class defining a use case that takes parameters and returns a [ResultFuture].
///* [Type]: The type of the result that will be returned by the use case.
/// * [Param]: The type of the parameter that is required by the use case.
abstract class UsecasewithParams<Type, Param> {
  ResultFuture<Type> call(Param param);
}

/// Abstract class defining a use case that does not take any parameters and returns a [ResultFuture].

abstract class UsecasewithoutParams<Type> {
  ResultFuture<Type> call();
}
