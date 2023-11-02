import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/favorites/domain/favorites_repos/favorites_repos.dart';
import 'package:dartz/dartz.dart';

class AddToFavoritesUseCase extends UseCase<void, String> {
  final FavoritesRepos favoritesReposImple;

  AddToFavoritesUseCase({required this.favoritesReposImple});

  @override
  Future<Either<ServerFalure, void>> call([String? bookId]) async {
    return favoritesReposImple.addToFavoritesBooks(bookId: bookId!);
  }
}
