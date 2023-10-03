import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/rating_section.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class SelectedBookCard extends StatelessWidget {
  const SelectedBookCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .20,
            child: const BookImage(
              imageUrl: "",
            )),
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
                  'The Psychology of Money',
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
                  r"The psychology of money is the study of our behavior with money. Success with money isn't about knowledge,"
                  "IQ or how good you are at math. It's about behavior, and everyone is prone to certain behaviors over others.",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: Styels.textStyle8.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const RatingSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
