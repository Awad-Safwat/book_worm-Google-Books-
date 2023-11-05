import 'package:book_worm/core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
    required this.book,
  });
  final dynamic book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: (book.rating != null) ? book.rating!.toDouble() : 1,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          unratedColor: Colors.grey,
          itemCount: 5,
          itemSize: 18.0,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          (book.rating != null) ? book.rating!.toDouble().toString() : "0.0",
          style: Styels.textStyle10.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
