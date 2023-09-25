import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/grab_now_button.dart';
import 'package:book_worm/features/home/presentation/views/widgets/learn_more_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PopularItemBody extends StatelessWidget {
  const PopularItemBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BookImage(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "The Steal Like An Artist",
              style: Styels.textStyle14.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Austin Kleon',
              style: Styels.textStyle10.copyWith(fontWeight: FontWeight.w600),
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
              style: Styels.textStyle14.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GrabNowButton(),
              SizedBox(
                height: 2,
              ),
              LearnMoreButton()
            ],
          ),
        ),
      ],
    );
  }
}
