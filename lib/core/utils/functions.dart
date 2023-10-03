import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksLocaly(
    {required List<BookEntity> extractedBooksList, required String boxName}) {
  var box = Hive.box(kFeatueredBox);
  box.addAll(extractedBooksList);
}

// func to extract books from json response to a list
List<BookEntity> extractingMapDataToList(Map<String, dynamic> response) {
  List<BookEntity> extractedBooksList = [];
  for (Map<String, dynamic> element in response['items']) {
    extractedBooksList.add(BookModel.fromJson(element));
  }

  return extractedBooksList;
}
