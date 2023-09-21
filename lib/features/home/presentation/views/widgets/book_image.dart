import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.bookTest,
    );
  }
}
