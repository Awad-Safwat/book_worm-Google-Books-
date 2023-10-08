import 'package:book_worm/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ShimmerFeatueredBooksList extends StatelessWidget {
  const ShimmerFeatueredBooksList({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.16,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              color: AppColors.loadingColor,
              width: screenSize.width * .22,
              height: screenSize.height * .16,
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
