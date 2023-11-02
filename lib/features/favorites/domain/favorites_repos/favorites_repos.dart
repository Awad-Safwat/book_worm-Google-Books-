import 'dart:ffi';

import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepos {
  Future<Either<ServerFalure, List<BookEntity>>> getFavoritesBooks(
      {required int pageNumber});
  Future<Either<ServerFalure, void>> addToFavoritesBooks(
      {required String bookId});
  Future<Either<ServerFalure, void>> deleteFromFavoritesBooks(
      {required String bookId});
}
