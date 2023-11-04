import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';

abstract class MyBooksRemoteDataSource {
  Future<List<BookEntity>> getMyBooks({int pageNumber = 0});
  Future<void> deleteFromMyBooks({required String bookId});
  Future<void> addToMyBooks({required String bookId});
}

class MyBooksRemoteDataSourceImple extends MyBooksRemoteDataSource {
  final ApiService apiService;

  MyBooksRemoteDataSourceImple({required this.apiService});

  @override
  Future<void> addToMyBooks({required String bookId}) async {
    await apiService.add(
        endPoint: 'mylibrary/bookshelves/7/addVolume',
        accessToken: getAccessToken()!,
        data: {
          'volumeId': bookId,
        });
  }

  @override
  Future<void> deleteFromMyBooks({required String bookId}) async {
    await apiService.delet(
        endPoint: 'mylibrary/bookshelves/7/removeVolume',
        accessToken: getAccessToken()!,
        data: {'volumeId': bookId});
  }

  @override
  Future<List<BookEntity>> getMyBooks({int pageNumber = 0}) async {
    var response = await apiService.get(
      endPoint:
          'mylibrary/bookshelves/7/volumes?startIndex=${pageNumber * 10}&access_token=${getAccessToken()}',
    );

    List<BookEntity> books = extractingMapDataToList(response);
    return books;
  }
}
