import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReadNowButton extends StatelessWidget {
  const ReadNowButton({
    super.key,
    this.buttonWidth = 50,
    this.buttonHeight = 30,
    this.topLeftRadius = 5,
    this.topRightRadius = 5,
    this.bottomLeftRadius = 5,
    this.bottomRightRadius = 5,
    required this.bookUrl,
  });
  final double buttonHeight,
      buttonWidth,
      topLeftRadius,
      topRightRadius,
      bottomLeftRadius,
      bottomRightRadius;
  final String bookUrl;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size(buttonWidth, buttonHeight)),
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius),
              topRight: Radius.circular(topRightRadius),
              bottomLeft: Radius.circular(bottomLeftRadius),
              bottomRight: Radius.circular(bottomRightRadius),
            ),
          ),
        ),
      ),
      onPressed: () {
        GoRouter.of(context).push(AppStrings.kBookWebView, extra: bookUrl);
      },
      child: Text(
        'Read Now',
        style: Styels.textStyle10.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
