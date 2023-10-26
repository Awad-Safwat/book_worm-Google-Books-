import 'package:book_worm/core/errors/faluer.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Faluer, Type>> call([Param param]);
}

class NoParam {}
