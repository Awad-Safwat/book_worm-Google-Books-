import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/domain/repos/home_view_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeatueredBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeViewRepo homeRepo;

  FetchFeatueredBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Faluer, List<BookEntity>>> call([int? pageNumber]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber ?? 0);
  }
}
