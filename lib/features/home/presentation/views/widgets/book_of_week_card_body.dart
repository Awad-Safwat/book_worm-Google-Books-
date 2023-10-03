import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/grab_now_button.dart';
import 'package:book_worm/features/home/presentation/views/widgets/learn_more_button.dart';
import 'package:flutter/material.dart';

class BookOfWeekCardBody extends StatelessWidget {
  const BookOfWeekCardBody({
    super.key,
    required this.book,
    required this.screenSize,
  });
  final BookEntity book;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.17,
                maxWidth: MediaQuery.sizeOf(context).width * 0.22,
              ),
              child: BookImage(
                imageUrl: book.imageUrl!,
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          SizedBox(
            width: screenSize.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookTitle!,
                  style: Styels.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  book.bookDiscreption ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: Styels.textStyle8,
                ),
                const SizedBox(
                  height: 2,
                ),
                const Row(
                  children: [
                    GrabNowButton(),
                    SizedBox(
                      width: 5,
                    ),
                    LearnMoreButton()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
