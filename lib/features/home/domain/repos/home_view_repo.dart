import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeViewRepo {
  Future<Either<ServerFalure, List<BookEntity>>> fetchFeaturedBooks(
      int pageNumber);
  Future<Either<ServerFalure, List<BookEntity>>> fetchNewestBooks(
      int pageNumber);
  // to do
  // add the book of the week func.
}
