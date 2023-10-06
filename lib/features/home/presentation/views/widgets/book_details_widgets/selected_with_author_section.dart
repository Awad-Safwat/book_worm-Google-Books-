import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/author_data_card.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/selected_book_card.dart';
import 'package:flutter/material.dart';

class BookWithAuthorSection extends StatelessWidget {
  const BookWithAuthorSection({
    super.key,
    required this.screenSize,
    required this.book,
  });
  final dynamic book;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * .28,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: AppColors.darkColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.directional(
            textDirection: TextDirection.ltr,
            height: screenSize.height * .16,
            top: screenSize.height * .05,
            start: screenSize.width * .11,
            child: SizedBox(
              child: SelectedBookCard(book: book),
            ),
          ),
          Positioned.directional(
            height: screenSize.height * 0.11,
            width: screenSize.width * 0.81,
            start: screenSize.width * .09,
            top: screenSize.height * .23,
            textDirection: TextDirection.ltr,
            child: AuthorDataCard(
              aoutherName: book.authorName ?? 'No name found',
            ),
          )
        ],
      ),
    );
  }
}
