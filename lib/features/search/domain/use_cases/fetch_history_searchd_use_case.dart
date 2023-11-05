import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/search/domain/repos/search_view_repo.dart';
import 'package:dartz/dartz.dart';

class FetchHistoryUseCase extends UseCase<List<BookEntity>, NoParam> {
  final SearchViewRepo searchViewRepo;

  FetchHistoryUseCase({required this.searchViewRepo});
  @override
  Future<Either<ServerFalure, List<BookEntity>>> call([NoParam? pragma]) async {
    return await searchViewRepo.fetchHistorySearchedBooks();
  }
}
