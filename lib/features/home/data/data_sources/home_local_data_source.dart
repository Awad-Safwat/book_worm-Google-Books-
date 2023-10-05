import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeatcheredBooks();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatcheredBooks() {
    Box<BookEntity> box = Hive.box(AppStrings.kFeatueredBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    Box<BookEntity> box = Hive.box(AppStrings.kNewestBox);
    return box.values.toList();
  }
}
