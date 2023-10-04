import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content_placeholder/flutter_content_placeholder.dart';
import 'package:go_router/go_router.dart';

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
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: ContentPlaceholder(
              child: SizedBox(
                width: screenSize.width * .22,
                height: screenSize.height * .16,
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
