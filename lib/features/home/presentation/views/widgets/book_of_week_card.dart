import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card_body.dart';
import 'package:flutter/material.dart';

class BookOfTheWeekCard extends StatelessWidget {
  const BookOfTheWeekCard({
    super.key,
    required this.book,
    required this.screenSize,
  });
  final BookEntity book;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: screenSize.width * 0.06,
          left: screenSize.width * 0.06,
          bottom: 10),
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
                blurRadius: 10,
              )
            ]),
        child: BookOfWeekCardBody(book: book, screenSize: screenSize),
      ),
    );
  }
}
