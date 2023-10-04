import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_item_body.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_newest_list_item_body.dart';
import 'package:flutter/material.dart';

class ShimmerNewestListItem extends StatelessWidget {
  const ShimmerNewestListItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
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
        child: ShimmerNewstListItemBody(
          screenSize: MediaQuery.sizeOf(context),
        ),
      ),
    );
  }
}
