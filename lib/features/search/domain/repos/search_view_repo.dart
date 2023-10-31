import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchViewRepo {
  Future<Either<ServerFalure, List<SearchedBookEntity>>> fetchSearchedBooks(
      String? searchKey,
      {int pageNumber});

  Future<Either<ServerFalure, List<SearchedBookEntity>>>
      fetchHistorySearchedBooks();
}
