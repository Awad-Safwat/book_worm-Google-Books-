import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: Color.fromARGB(255, 231, 231, 231),
          )
        ],
      ),
      child: Image.asset(
        AssetsData.bookTest,
      ),
    );
  }
}
