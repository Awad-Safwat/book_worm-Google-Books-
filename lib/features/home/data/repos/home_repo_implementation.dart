import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_worm/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/domain/repos/home_view_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeViewRepoImple extends HomeViewRepo {
  final HomeLocalDataSourceImple localDataSource;
  final HomeRemoteDataSourceImpl remoteDataSourec;

  HomeViewRepoImple({
    required this.localDataSource,
    required this.remoteDataSourec,
  });

  @override
  Future<Either<ServerFalure, List<BookEntity>>> fetchFeaturedBooks(
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
  Future<Either<ServerFalure, List<BookEntity>>> fetchNewestBooks(
      int pageNumber) async {
    List<BookEntity> books;
    try {
      books = localDataSource.fetchNewestBooks(pageNumber: pageNumber);
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
