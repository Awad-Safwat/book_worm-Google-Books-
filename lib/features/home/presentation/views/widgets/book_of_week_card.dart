import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/helper.dart';
import 'package:flutter/material.dart';

class BookOfTheWeekCard extends StatelessWidget {
  const BookOfTheWeekCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: AppHelper.gitBritness(context) == Brightness.dark
                ? AppHelper.secondryColordark
                : AppHelper.secondryColorLight,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppHelper.gitBritness(context) == Brightness.dark
                    ? AppHelper.shadowColordark
                    : AppHelper.shadowColorLight,
                blurRadius: 20,
              )
            ]),
        height: MediaQuery.of(context).size.height * .18,
        width: MediaQuery.of(context).size.width * .86,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
                child: Image.asset(
                  AssetsData.bookTest,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Text(
                      'The Psychology of Money',
                      style: Styels.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      r"The psychology of money is the study of our behavior with money. Success with money isn't about knowledge, IQ or how good you are at math. It's about behavior, and everyone is prone to certain behaviors over others.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: Styels.textStyle8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
