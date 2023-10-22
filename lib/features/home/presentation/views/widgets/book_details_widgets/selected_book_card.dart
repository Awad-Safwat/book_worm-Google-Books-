import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/rating_section.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class SelectedBookCard extends StatelessWidget {
  const SelectedBookCard({
    super.key,
    required this.book,
  });
  final dynamic book;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .20,
          child: BookImage(imageUrl: book.imageUrl!),
        ),
        const SizedBox(
          width: 25,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookTitle!,
                  style: Styels.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  book.bookDiscreption!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Styels.textStyle8.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                RatingSection(
                  book: book,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
