import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:book_worm/features/search/domain/repos/search_view_repo.dart';
import 'package:dartz/dartz.dart';

class FetchHistoryUseCase extends UseCase<List<SearchedBookEntity>, NoParam> {
  final SearchViewRepo searchViewRepo;

  FetchHistoryUseCase({required this.searchViewRepo});
  @override
  Future<Either<Faluer, List<SearchedBookEntity>>> call(
      [NoParam? pragma]) async {
    return await searchViewRepo.fetchHistorySearchedBooks();
  }
}
