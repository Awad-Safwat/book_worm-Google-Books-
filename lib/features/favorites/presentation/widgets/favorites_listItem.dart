import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/favorites/presentation/widgets/favorites_list_item_body.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_item_body.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_result_list_item_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritesListItem extends StatelessWidget {
  const FavoritesListItem({
    super.key,
    required this.book,
  });
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.gitBritness(context) == Brightness.dark
                ? AppColors.secondryColordark
                : AppColors.secondryColorLight,
            borderRadius: BorderRadius.circular(20),
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
        child: FavoritesListItemBody(book: book),
      ),
    );
  }
}
