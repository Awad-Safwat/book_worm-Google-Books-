import 'package:book_worm/core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: 5,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 18.0,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          '(5.0)',
          style: Styels.textStyle10.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
