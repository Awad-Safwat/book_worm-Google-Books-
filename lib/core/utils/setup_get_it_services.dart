import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/features/auth/data/repo_imple/auth_repo_imple.dart';
import 'package:book_worm/features/favorites/data/data_sources/favorites_remote_data_source.dart';
import 'package:book_worm/features/favorites/data/favorites_repos_imple/favorites_repos_imple.dart';
import 'package:book_worm/features/favorites/domain/use_cases/add_favorites_use_case.dart';
import 'package:book_worm/features/favorites/domain/use_cases/delete_from_favorites_use_case.dart';
import 'package:book_worm/features/favorites/domain/use_cases/get_favorites_use_case.dart';
import 'package:book_worm/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:book_worm/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_worm/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_worm/features/home/data/repos/home_repo_implementation.dart';
import 'package:book_worm/features/my_books/data/data_sources/my_books_remote_data_source.dart';
import 'package:book_worm/features/my_books/data/repos_imple/my_books_repos_imple.dart';
import 'package:book_worm/features/my_books/domain/my_books_use_cases/get_my_books_use_case.dart';
import 'package:book_worm/features/my_books/presentation/manager/get_my_books_cubit/get_my_books_cubit.dart';
import 'package:book_worm/features/search/data/data_sources/search_local_data_source.dart';
import 'package:book_worm/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:book_worm/features/search/data/repos/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void settingUpGetItServices() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeViewRepoImple>(
    HomeViewRepoImple(
      localDataSource: HomeLocalDataSourceImple(),
      remoteDataSourec: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<AuthRepoImpel>(AuthRepoImpel());

  getIt.registerSingleton<SearchRepoImplementation>(SearchRepoImplementation(
    searchLocalDataSource: SearchLocalDataSourceImple(),
    searchRemoteDataSource: SearchRemoteDataSourceImple(
      apiService: getIt.get<ApiService>(),
    ),
  ));

  getIt.registerSingleton<FavoritesReposImple>(FavoritesReposImple(
      favoritesRemDSourceImple: FavoritesRometeDataSourceImple(
    apiService: getIt.get<ApiService>(),
  )));

  getIt.registerSingleton<GetMyBooksUseCase>(
    GetMyBooksUseCase(
      myBooksReposImple: MyBooksReposImple(
        myBooksRemoteDataSourceImple: MyBooksRemoteDataSourceImple(
          apiService: getIt.get<ApiService>(),
        ),
      ),
    ),
  );
}
