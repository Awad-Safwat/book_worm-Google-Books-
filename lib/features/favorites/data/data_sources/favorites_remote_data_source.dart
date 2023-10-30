import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<BookEntity>> getFavoritesBooks();
}

class FavoritesRometeDataSourceImple extends FavoritesRemoteDataSource {
  final ApiService apiService;

  FavoritesRometeDataSourceImple({required this.apiService});
  @override
  Future<List<BookEntity>> getFavoritesBooks() async {
    var response = await apiService.get(
      endPoint: 'mylibrary/bookshelves/',
      accessToken: getAccessToken(),
      shilfId: 0,
    );

    List<BookEntity> books = extractingMapDataToList(response);
    return books;
  }
}
