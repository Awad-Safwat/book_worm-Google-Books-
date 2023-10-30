import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/favorites/domain/repos/favorites_repos.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

class GetFavoritesUseCase extends UseCase<List<BookEntity>, int> {
  final FavoritesRepos favoritesRepos;

  GetFavoritesUseCase({required this.favoritesRepos});
  @override
  Future<Either<Faluer, List<BookEntity>>> call([int? pageNumber]) async {
    // TODO: implement call
    return favoritesRepos.getFavoritesBooks(pageNumber: pageNumber ?? 0);
  }
}
