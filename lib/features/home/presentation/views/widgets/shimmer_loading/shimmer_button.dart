import 'package:flutter/material.dart';
import 'package:flutter_content_placeholder/flutter_content_placeholder.dart';

class ShimmerButton extends StatelessWidget {
  const ShimmerButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ContentPlaceholder(
      width: screenSize.width * .16,
      height: screenSize.height * .02,
    );
  }
}
