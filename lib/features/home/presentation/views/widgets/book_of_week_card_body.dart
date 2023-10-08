import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/read_now_button.dart';
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
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.15,
            maxWidth: MediaQuery.sizeOf(context).width * 0.20,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: BookImage(
              imageUrl: book.imageUrl!,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: screenSize.height * 0.20,
            maxWidth: screenSize.width * 0.40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                maxLines: 4,
                style: Styels.textStyle8,
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  ReadNowButton(
                    bookUrl: book.bookWebViewUrl ?? '',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  LearnMoreButton(
                    book: book,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
