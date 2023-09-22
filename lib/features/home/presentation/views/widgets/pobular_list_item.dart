import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/home/presentation/views/widgets/popular_item_body.dart';
import 'package:flutter/material.dart';

class PobularListItem extends StatelessWidget {
  const PobularListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppHelper.gitBritness(context) == Brightness.dark
              ? AppHelper.secondryColordark
              : AppHelper.secondryColorLight,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppHelper.gitBritness(context) == Brightness.dark
                  ? AppHelper.shadowColordark
                  : AppHelper.shadowColorLight,
              blurRadius: 3,
            )
          ]),
      height: MediaQuery.of(context).size.height * .13,
      width: MediaQuery.of(context).size.width * .90,
      child: const PopularItemBody(),
    );
  }
}
