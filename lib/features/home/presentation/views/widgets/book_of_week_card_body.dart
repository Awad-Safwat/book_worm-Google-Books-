import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/grab_now_button.dart';
import 'package:book_worm/features/home/presentation/views/widgets/learn_more_button.dart';
import 'package:flutter/material.dart';

class BookOfWeekCardBody extends StatelessWidget {
  const BookOfWeekCardBody({
    super.key,
    required this.screenSize,
  });

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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: BookImage(),
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
                  'The Psychology of Money',
                  style: Styels.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  r"The psychology of money is the study of our behavior with money. Success with money isn't about knowledge,"
                  "IQ or how good you are at math. It's about behavior, and everyone is prone to certain behaviors over others.",
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
