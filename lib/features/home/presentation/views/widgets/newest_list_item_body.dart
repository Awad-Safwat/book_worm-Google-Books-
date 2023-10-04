import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/grab_now_button.dart';
import 'package:book_worm/features/home/presentation/views/widgets/learn_more_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewstListItemBody extends StatelessWidget {
  const NewstListItemBody({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: BookImage(
              imageUrl: book.imageUrl!,
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
                  style:
                      Styels.textStyle14.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  book.authorName!,
                  style:
                      Styels.textStyle10.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      '5.0',
                      style: Styels.textStyle10.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffF24F09),
                      ),
                    ),
                    Text(" | " "Based on 23k Reviews",
                        style: Styels.textStyle10
                            .copyWith(fontWeight: FontWeight.normal)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  r'$' ' 45.87',
                  style:
                      Styels.textStyle14.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GrabNowButton(),
                LearnMoreButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
