import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/favorites/data/data_sources/favorites_remote_data_source.dart';
import 'package:book_worm/features/favorites/domain/favorites_repos/favorites_repos.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FavoritesReposImple extends FavoritesRepos {
  final FavoritesRometeDataSourceImple favoritesRemDSourceImple;

  FavoritesReposImple({required this.favoritesRemDSourceImple});
  @override
  Either<Faluer, int> addToFavoritesBooks({required String bookId}) {
    // TODO: implement addToFavoritesBooks
    throw UnimplementedError();
  }

  @override
  Either<Faluer, int> deleteFromFavoritesBooks({required String bookId}) {
    // TODO: implement deleteFromFavoritesBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Faluer, Future<List<BookEntity>>>> getFavoritesBooks(
      {required int pageNumber}) async {
    try {
      var books = await favoritesRemDSourceImple.getFavoritesBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }
}
