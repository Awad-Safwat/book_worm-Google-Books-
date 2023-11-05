import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/learn_more_button.dart';
import 'package:book_worm/features/home/presentation/views/widgets/read_now_button.dart';
import 'package:flutter/material.dart';

class NewstListItemBody extends StatelessWidget {
  const NewstListItemBody({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BookImage(
            imageUrl: book.imageUrl ?? '',
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width - 255,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.bookTitle ?? 'not found',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styels.textStyle14.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                book.authorName ?? 'not found',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styels.textStyle10.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Text(
                    (book.rating != null)
                        ? book.rating!.toDouble().toString()
                        : "0.0",
                    style: Styels.textStyle10.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffF24F09),
                    ),
                  ),
                  Text(" | " "Based on ${book.ratingCount ?? '0'} Reviews",
                      style: Styels.textStyle10
                          .copyWith(fontWeight: FontWeight.normal)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                (book.isEbook!)
                    ? (book.price == '0' || book.price == null)
                        ? 'free'
                        : '${book.price!} EGP'
                    : 'Not for sale',
                style: Styels.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReadNowButton(book: book),
              LearnMoreButton(
                book: book,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
