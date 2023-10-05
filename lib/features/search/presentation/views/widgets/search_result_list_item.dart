import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_item_body.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_result_list_item_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultListItem extends StatelessWidget {
  const SearchResultListItem({
    super.key,
  });

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
          // GoRouter.of(context).push(AppStrings.kBookDetailsView, extra: book);
        },
        child: const SearchResultListItemBody(),
      ),
    );
  }
}
