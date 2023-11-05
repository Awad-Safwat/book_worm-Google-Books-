import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchHistoryData();
}

class SearchLocalDataSourceImple extends SearchLocalDataSource {
  @override
  List<BookEntity> fetchHistoryData() {
    Box<BookEntity> box = Hive.box<BookEntity>(AppStrings.kHistoryBox);
    var boxValues = box.values.toSet();
    return boxValues.toList();
  }
}
