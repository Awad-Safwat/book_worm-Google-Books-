import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/search/data/models/searched_book_model/searched_book_model.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksLocaly(
    {required List<BookEntity> extractedBooksList, required String boxName}) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(extractedBooksList);
}

// func to extract books from json response to a list
List<BookEntity> extractingMapDataToListForHomeFeature(
    Map<String, dynamic> response) {
  List<BookEntity> extractedBooksList = [];
  for (Map<String, dynamic> element in response['items']) {
    extractedBooksList.add(BookModel.fromJson(element));
  }

  return extractedBooksList;
}

List<SearchedBookEntity> extractingMapDataToList(
    Map<String, dynamic> response) {
  List<SearchedBookEntity> extractedBooksList = [];
  for (Map<String, dynamic> element in response['items']) {
    extractedBooksList.add(SearchedBookModel.fromJson(element));
  }

  return extractedBooksList;
}
