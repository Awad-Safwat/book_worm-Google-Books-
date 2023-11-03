import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_button.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShimmerNewstListItemBody extends StatelessWidget {
  const ShimmerNewstListItemBody({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ShimmerImage(
            screenSize: screenSize,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerText(screenSize: screenSize),
            const SizedBox(
              height: 3,
            ),
            ShimmerText(screenSize: screenSize),
            const SizedBox(
              height: 5,
            ),
            ShimmerText(screenSize: screenSize),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerButton(screenSize: screenSize),
              ShimmerButton(screenSize: screenSize),
            ],
          ),
        ),
      ],
    );
  }
}
