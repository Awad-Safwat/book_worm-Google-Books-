import 'package:flutter/material.dart';
import 'package:flutter_content_placeholder/flutter_content_placeholder.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ContentPlaceholder(
      width: screenSize.width * .25,
      height: screenSize.height * .01,
    );
  }
}
