import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:book_worm/features/search/domain/repos/search_view_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSearchedBooksUseCase
    extends UseCase<List<SearchedBookEntity>, Map<String, dynamic>> {
  final SearchViewRepo searchViewRepo;

  FetchSearchedBooksUseCase({required this.searchViewRepo});
  @override
  Future<Either<ServerFalure, List<SearchedBookEntity>>> call(
      [Map<String, dynamic>? paramsMap]) async {
    return await searchViewRepo.fetchSearchedBooks(
      paramsMap?['searchKey'],
      pageNumber: paramsMap?['pageNumber'],
    );
  }
}
