import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_worm/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_worm/features/home/data/repos/home_repo_implementation.dart';
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
  getIt.registerSingleton<HomeRepoImple>(
    HomeRepoImple(
      localDataSource: HomeLocalDataSourceImple(),
      remoteDataSourec: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<SearchRepoImplementation>(SearchRepoImplementation(
    searchLocalDataSource: SearchLocalDataSourceImple(),
    searchRemoteDataSource: SearchRemoteDataSourceImple(
      apiService: getIt.get<ApiService>(),
    ),
  ));
}
