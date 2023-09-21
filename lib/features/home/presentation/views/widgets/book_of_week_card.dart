import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/helper.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                blurRadius: 20,
              )
            ]),
        height: screenSize.height * .20,
        width: screenSize.width * .86,
        child: BookOfWeekCardBody(screenSize: screenSize),
      ),
    );
  }
}
