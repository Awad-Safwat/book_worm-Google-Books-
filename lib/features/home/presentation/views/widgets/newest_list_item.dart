import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_item_body.dart';
import 'package:flutter/material.dart';

class NewestListItem extends StatelessWidget {
  const NewestListItem({super.key, required this.book});
  final BookEntity book;
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
      child: NewstListItemBody(
        book: book,
      ),
    );
  }
}
