import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepos {
  Either<Faluer, List<BookEntity>> getFavoritesBooks({required int pageNumber});
  Either<Faluer, List<BookEntity>> addToFavoritesBooks(
      {required int pageNumber, required String bookId});
  Either<Faluer, int> deleteFromFavoritesBooks({required String bookId});
}
