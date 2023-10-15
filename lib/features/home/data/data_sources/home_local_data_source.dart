import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks({int pageNumber});
  List<BookEntity> fetchFeatueredBooks({int pageNumber});
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  HomeLocalDataSourceImple();
  @override
  List<BookEntity> fetchFeatueredBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10, endIndex = (pageNumber + 1) * 10;

    Box<BookEntity> box = Hive.box(AppStrings.kFeatueredBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) return [];
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10, endIndex = (pageNumber + 1) * 10;
    Box<BookEntity> box = Hive.box(AppStrings.kNewestBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) return [];
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
