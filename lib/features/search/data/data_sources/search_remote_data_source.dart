import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchedBooks(String? searchKey,
      {int pageNumber});
}

class SearchRemoteDataSourceImple extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImple({required this.apiService});
  @override
  Future<List<BookEntity>> fetchSearchedBooks(String? searchKey,
      {int pageNumber = 0}) async {
    var response = await apiService.get(
        endPoint:
            'volumes?q=$searchKey&orderBy=relevance&startIndex=${pageNumber * 10}');

    List<BookEntity> extractedList = extractingMapDataToList(response);

    return extractedList;
  }
}
