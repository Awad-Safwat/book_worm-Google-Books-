import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card_body.dart';
import 'package:flutter/material.dart';

class BookOfTheWeekCard extends StatelessWidget {
  const BookOfTheWeekCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          right: screenSize.width * 0.06, left: screenSize.width * 0.06),
      child: Container(
        decoration: BoxDecoration(
            color: AppHelper.gitBritness(context) == Brightness.dark
                ? AppHelper.secondryColordark
                : AppHelper.secondryColorLight,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppHelper.gitBritness(context) == Brightness.dark
                    ? AppHelper.shadowColordark
                    : AppHelper.shadowColorLight,
                blurRadius: 10,
              )
            ]),
        child: BookOfWeekCardBody(screenSize: screenSize),
      ),
    );
  }
}
