import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_item_body.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_result_list_item_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultListItem extends StatelessWidget {
  const SearchResultListItem({
    super.key,
    required this.book,
  });
  final SearchedBookEntity book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.gitBritness(context) == Brightness.dark
              ? AppColors.secondryColordark
              : AppColors.secondryColorLight,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.gitBritness(context) == Brightness.dark
                  ? AppColors.shadowColordark
                  : AppColors.shadowColorLight,
              blurRadius: 3,
            )
          ]),
      height: MediaQuery.of(context).size.height * .13,
      width: MediaQuery.of(context).size.width * .90,
      child: GestureDetector(
        onTap: () {
          saveBooksLocaly(
              extractedBooksList: [book], boxName: AppStrings.kHistoryBox);
          GoRouter.of(context)
              .push(AppStrings.kSearchedBookDetailsView, extra: book);
        },
        child: SearchResultListItemBody(book: book),
      ),
    );
  }
}
