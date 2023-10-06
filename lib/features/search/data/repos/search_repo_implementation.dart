import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/features/search/data/data_sources/search_local_data_source.dart';
import 'package:book_worm/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:book_worm/features/search/domain/repos/search_view_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation extends SearchViewRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;
  // final String searchKey;

  SearchRepoImplementation(
      {required this.searchLocalDataSource,
      required this.searchRemoteDataSource});

  @override
  Future<Either<Faluer, List<SearchedBookEntity>>>
      fetchHistorySearchedBooks() async {
    List<SearchedBookEntity> books;
    try {
      books = searchLocalDataSource.fetchHistoryData();

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }

  @override
  Future<Either<Faluer, List<SearchedBookEntity>>> fetchSearchedBooks(
      String? searchKey) async {
    List<SearchedBookEntity> books;
    try {
      books = await searchRemoteDataSource.fetchSearchedBooks(searchKey ?? '');
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }
}
