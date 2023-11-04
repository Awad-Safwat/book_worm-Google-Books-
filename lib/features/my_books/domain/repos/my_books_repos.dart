import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MyBooksRepos {
  Future<Either<ServerFalure, List<BookEntity>>> getMyBooks(
      {required int pageNumber});
  Future<Either<ServerFalure, void>> addToMyBooks({required String bookId});
  Future<Either<ServerFalure, void>> deleteFromMyBooks(
      {required String bookId});
}
