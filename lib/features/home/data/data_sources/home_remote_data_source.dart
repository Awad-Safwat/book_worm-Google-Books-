import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatueredBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeatueredBooks({int pageNumber = 0}) async {
    var response = await apiService.get(
        endPoint:
            'volumes?q=mental%20health&orderBy=newest&startIndex=${pageNumber * 10}');

    List<BookEntity> extractedBooksList =
        extractingMapDataToListForHomeFeature(response);

    saveBooksLocaly<BookEntity>(
      extractedBooksList: extractedBooksList.toSet(),
      boxName: AppStrings.kFeatueredBox,
    );

    return extractedBooksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var response = await apiService.get(
        endPoint:
            'volumes?q=programming&orderBy=newest&startIndex=${pageNumber * 10}');

    List<BookEntity> extractedBooksList =
        extractingMapDataToListForHomeFeature(response);

    saveBooksLocaly(
      extractedBooksList: extractedBooksList.toSet(),
      boxName: AppStrings.kNewestBox,
    );
    return extractedBooksList;
  }
}
