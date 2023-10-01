import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/domain/repos/home_view_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeatcheredBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeViewRepo homeRepo;

  FetchFeatcheredBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Faluer, List<BookEntity>>> call([NoParam? pragma]) {
    return homeRepo.fetchFeatcheredBooks();
  }
}
