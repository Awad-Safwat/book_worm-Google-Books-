import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeViewRepo {
  Future<Either<Faluer, List<BookEntity>>> fetchFeatcheredBooks(int pageNumber);
  Future<Either<Faluer, List<BookEntity>>> fetchNewestBooks(int pageNumber);
  // to do
  // add the book of the week func.
}
