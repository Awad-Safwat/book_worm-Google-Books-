import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_button.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content_placeholder/flutter_content_placeholder.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookOfWeekCardBody extends StatelessWidget {
  const ShimmerBookOfWeekCardBody({
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.17,
                maxWidth: MediaQuery.sizeOf(context).width * 0.22,
              ),
              child: ShimmerImage(screenSize: screenSize),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          SizedBox(
            width: screenSize.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerText(screenSize: screenSize),
                const SizedBox(
                  height: 3,
                ),
                ShimmerText(screenSize: screenSize),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    ShimmerButton(screenSize: screenSize),
                    const SizedBox(
                      width: 5,
                    ),
                    ShimmerButton(screenSize: screenSize),

                    // Shimmer.fromColors(
                    //   baseColor: Colors.black12,
                    //   highlightColor: Colors.grey,
                    //   child: Container(
                    //     color: Colors.black,
                    //     width: screenSize.width * .19,
                    //     height: screenSize.height * .02,
                    //   ),
                    // ),
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
