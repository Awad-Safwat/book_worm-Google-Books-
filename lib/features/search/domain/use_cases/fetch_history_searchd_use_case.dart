import 'package:book_worm/core/use_cases/use_case.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';

abstract class FetchHistoryUseCase
    extends UseCase<List<SearchedBookEntity>, NoParam> {}
