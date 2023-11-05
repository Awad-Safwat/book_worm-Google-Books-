import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchViewRepo {
  Future<Either<ServerFalure, List<BookEntity>>> fetchSearchedBooks(
      String? searchKey,
      {int pageNumber});

  Future<Either<ServerFalure, List<BookEntity>>> fetchHistorySearchedBooks();
}
