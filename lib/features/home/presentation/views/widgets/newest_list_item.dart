import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/favorites/presentation/manager/add_delet_favorite_cubit/add_delete_favorite_cubit.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewestListItem extends StatelessWidget {
  const NewestListItem({super.key, required this.book});
  final BookEntity book;
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
          BlocProvider.of<AddDeleteFavoriteCubit>(context)
              .checkIsFavoriteBook(book: book);
          GoRouter.of(context).push(AppStrings.kBookDetailsView, extra: book);
        },
        child: NewstListItemBody(
          book: book,
        ),
      ),
    );
  }
}
