import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:hive/hive.dart';

abstract class SearchLocalDataSource {
  List<SearchedBookEntity> fetchHistoryData();
}

class SearchLocalDataSourceImple extends SearchLocalDataSource {
  @override
  List<SearchedBookEntity> fetchHistoryData() {
    Box<SearchedBookEntity> box = Hive.box(AppStrings.kHistoryBox);
    var boxValues = box.values.toSet();
    return boxValues.toList();
  }
}
