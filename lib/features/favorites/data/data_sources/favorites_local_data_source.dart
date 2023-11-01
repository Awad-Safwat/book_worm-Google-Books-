import 'package:book_worm/core/utils/functions.dart';

abstract class FavoritesLocalData {
  bool checkIsFavoriteBook({required String bookId});
  void deleteFromLocalFavoritesBooks({required String bookId});
  void addToLocalFavoritesBooks({required String bookId});
}

class FavoritesLocalDataImple extends FavoritesLocalData {
  @override
  void addToLocalFavoritesBooks({required String bookId}) {
    addToFavoritesLocal(bookId: bookId);
  }

  @override
  bool checkIsFavoriteBook({required String bookId}) {
    return isFavorite(bookId: bookId);
  }

  @override
  void deleteFromLocalFavoritesBooks({required String bookId}) {
    deletAFavoriteLocal(bookId: bookId);
  }
}
