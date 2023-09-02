import 'dart:async';

import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/onboarding/presentation/views/helper/helper.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardPageBottomSheet extends StatefulWidget {
  const OnBoardPageBottomSheet({super.key});

  @override
  State<OnBoardPageBottomSheet> createState() => _OnBoardPageBottomSheetState();
}

class _OnBoardPageBottomSheetState extends State<OnBoardPageBottomSheet> {
  /// Used to trigger an event when the widget has been built
  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .14,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: initializeController(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Just return a placeholder widget, here it's nothing but you have to return something to avoid errors
            return const SizedBox();
          }
          return Center(
            child: OnBoardingHelper.currentPageIndex == 0
                ? Column(
                    children: [
                      SmoothPageIndicator(
                        controller: OnBoardingHelper.controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            expansionFactor: 5,
                            activeDotColor: AppHelper.primaryColor,
                            dotHeight: 6,
                            dotWidth: 6,
                            spacing: MediaQuery.of(context).size.width * .02),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              AppHelper.primaryColor),
                        ),
                        onPressed: () {},
                        child: const Center(
                          child: Text('Get Statrt'),
                        ),
                      ),
                    ],
                  )
                : SmoothPageIndicator(
                    controller: OnBoardingHelper.controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        expansionFactor: 5,
                        activeDotColor: AppHelper.primaryColor,
                        dotHeight: 6,
                        dotWidth: 6,
                        spacing: MediaQuery.of(context).size.width * .02),
                  ),
          );
        },
      ),
    );
  }
}
