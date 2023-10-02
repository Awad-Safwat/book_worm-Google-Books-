import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatueredBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeatueredBooks() async {
    var response = await apiService.get(endPoint: 'volumes?q=programming');

    List<BookEntity> extractedBooksList = extractingMapDataToList(response);

    saveBooksLocaly(
      extractedBooksList: extractedBooksList,
      boxName: kFeatueredBox,
    );

    return extractedBooksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response =
        await apiService.get(endPoint: 'volumes?q=programming&orderBy=newest');

    List<BookEntity> extractedBooksList = extractingMapDataToList(response);

    saveBooksLocaly(
      extractedBooksList: extractedBooksList,
      boxName: kNewestBox,
    );
    return extractedBooksList;
  }
}
