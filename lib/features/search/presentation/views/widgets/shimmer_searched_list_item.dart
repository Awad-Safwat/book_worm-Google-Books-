import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_item_body.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_newest_list_item_body.dart';
import 'package:book_worm/features/search/presentation/views/widgets/shimmer_searched_list_item_body.dart';
import 'package:flutter/material.dart';

class ShimmerSearchedListItem extends StatelessWidget {
  const ShimmerSearchedListItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
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
        child: ShimmerSearchedListItemBody(
          screenSize: MediaQuery.sizeOf(context),
        ),
      ),
    );
  }
}
