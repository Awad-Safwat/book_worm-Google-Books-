import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchedBookEntity>> fetchSearchedBooks(String? searchKey,
      {int pageNumber});
}

class SearchRemoteDataSourceImple extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImple({required this.apiService});
  @override
  Future<List<SearchedBookEntity>> fetchSearchedBooks(String? searchKey,
      {int pageNumber = 0}) async {
    var response = await apiService.get(
        endPoint:
            'volumes?q=$searchKey&orderBy=relevance&startIndex=${pageNumber * 10}');

    List<SearchedBookEntity> extractedList =
        extractingMapDataToListSearchFeature(response);

    return extractedList;
  }
}
