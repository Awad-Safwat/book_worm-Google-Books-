import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/favorites/domain/favorites_repos/favorites_repos.dart';
import 'package:dartz/dartz.dart';

class AddToFavoritesUseCase extends UseCase<int, String> {
  final FavoritesRepos favoritesRepos;

  AddToFavoritesUseCase({required this.favoritesRepos});

  @override
  Future<Either<ServerFalure, int>> call([String? bookId]) async {
    // {'pageNumber': pageNumber,'bookId':bookId}
    return favoritesRepos.addToFavoritesBooks(bookId: bookId!);
  }
}
