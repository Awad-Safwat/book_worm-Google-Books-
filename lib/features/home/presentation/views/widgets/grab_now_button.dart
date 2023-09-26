import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/helper.dart';
import 'package:flutter/material.dart';

class GrabNowButton extends StatelessWidget {
  const GrabNowButton({
    super.key,
    this.buttonWidth = 50,
    this.buttonHeight = 30,
    this.topLeftRadius = 5,
    this.topRightRadius = 5,
    this.bottomLeftRadius = 5,
    this.bottomRightRadius = 5,
  });
  final double buttonHeight,
      buttonWidth,
      topLeftRadius,
      topRightRadius,
      bottomLeftRadius,
      bottomRightRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size(buttonWidth, buttonHeight)),
        backgroundColor: MaterialStateProperty.all(AppHelper.primaryColor),
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
      onPressed: () {},
      child: Text(
        'Grab Now',
        style: Styels.textStyle10.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
