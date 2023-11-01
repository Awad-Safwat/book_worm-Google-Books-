import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<BookEntity>> getFavoritesBooks();
  Future<void> deleteFromFavoritesBooks({required String bookId});
  Future<void> addToFavoritesBooks({required String bookId});
}

class FavoritesRometeDataSourceImple extends FavoritesRemoteDataSource {
  final ApiService apiService;

  FavoritesRometeDataSourceImple({required this.apiService});
  @override
  Future<List<BookEntity>> getFavoritesBooks() async {
    var response = await apiService.get(
      endPoint:
          'mylibrary/bookshelves/0/volumes?access_token=${getAccessToken()}',
    );

    List<BookEntity> books = extractingMapDataToList(response);
    return books;
  }

  @override
  Future<void> addToFavoritesBooks({required String bookId}) async {
    await apiService.add(
      endPoint:
          'mylibrary/bookshelves/0/addVolume?volumeId=$bookId&accessToken=${getAccessToken()}',
    );
  }

  @override
  Future<void> deleteFromFavoritesBooks({required String bookId}) async {
    await apiService.delet(
      endPoint:
          'mylibrary/bookshelves/0/removeVolume?volumeId=$bookId&accessToken=${getAccessToken()}',
    );
  }
}
