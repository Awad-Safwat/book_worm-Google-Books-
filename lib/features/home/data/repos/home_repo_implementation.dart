import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_worm/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/domain/repos/home_view_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple extends HomeViewRepo {
  final HomeLocalDataSourceImple localDataSource;
  final HomeRemoteDataSourceImpl remoteDataSourec;

  HomeRepoImple({
    required this.localDataSource,
    required this.remoteDataSourec,
  });

  @override
  Future<Either<Faluer, List<BookEntity>>> fetchFeatcheredBooks(
      int pageNumber) async {
    List<BookEntity> books;
    try {
      books = localDataSource.fetchFeatueredBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      } else {
        books =
            await remoteDataSourec.fetchFeatueredBooks(pageNumber: pageNumber);
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }

  @override
  Future<Either<Faluer, List<BookEntity>>> fetchNewestBooks(
      int pageNumber) async {
    List<BookEntity> books;
    try {
      books = localDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      } else {
        books = await remoteDataSourec.fetchNewestBooks(pageNumber: pageNumber);
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }
}
