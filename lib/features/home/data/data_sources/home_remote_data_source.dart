import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatcheredBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeatcheredBooks() async {
    var response = await apiService.get(endPoint: 'volumes?q=programming');

    List<BookEntity> extractedBooksList = extractingMapDataToList(response);
    return extractedBooksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response =
        await apiService.get(endPoint: 'volumes?q=programming&orderBy=newest');

    List<BookEntity> extractedBooksList = extractingMapDataToList(response);
    return extractedBooksList;
  }

  // list to extract books from json response to a list
  List<BookEntity> extractingMapDataToList(Map<String, dynamic> response) {
    List<BookEntity> extractedBooksList = [];
    for (Map<String, dynamic> element in response['items']) {
      extractedBooksList.add(BookModel.fromJson(element));
    }
    return extractedBooksList;
  }
}
