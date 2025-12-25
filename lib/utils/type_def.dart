import 'package:dartz/dartz.dart';

typedef ResultOrException<T> = Future<Either<String, T>>;
