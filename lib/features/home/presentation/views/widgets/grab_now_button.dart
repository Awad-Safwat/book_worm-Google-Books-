import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/helper.dart';
import 'package:flutter/material.dart';

class GrabNowButton extends StatelessWidget {
  const GrabNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30,
      color: AppHelper.primaryColor,
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Text(
        'Grab Now',
        style: Styels.textStyle10.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
