import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/learn_more_button.dart';
import 'package:book_worm/features/home/presentation/views/widgets/read_now_button.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:flutter/material.dart';

class SearchResultListItemBody extends StatelessWidget {
  const SearchResultListItemBody({
    super.key,
    required this.book,
  });
  final SearchedBookEntity book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * .16,
              maxHeight: MediaQuery.sizeOf(context).height * .16,
            ),
            child: BookImage(
              imageUrl: book.imageUrl ??
                  'https://demofree.sirv.com/nope-not-here.jpg',
            ),
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
                book.bookTitle!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styels.textStyle14.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                book.authorName ?? 'No Name found',
                style: Styels.textStyle10.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
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
