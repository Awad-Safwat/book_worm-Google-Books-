import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/widgets/custom_app_bar.dart';
import 'package:book_worm/features/onboarding/presentation/views/helper/helper.dart';
import 'package:book_worm/features/onboarding/presentation/views/widgets/onboard_page_body_itme.dart';
import 'package:flutter/material.dart';

class OnBoardViewBody extends StatefulWidget {
  const OnBoardViewBody({super.key});

  @override
  State<OnBoardViewBody> createState() => _OnBoardViewBodyState();
}

class _OnBoardViewBodyState extends State<OnBoardViewBody> {
  @override
  void dispose() {
    OnBoardingHelper.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<OnBoardingPageBodyItem> OnBoardingItemsList = [
      OnBoardingPageBodyItem(
        height: height,
        width: width,
        image: Image.asset(
          AssetsData.onBoardingImage1,
          fit: BoxFit.fill,
        ),
        title: 'Only Books Can Help You',
        supTitle:
            'Books can help you to increase your knowledge and become more successfully.',
      ),
      OnBoardingPageBodyItem(
        height: height,
        width: width,
        image: Image.asset(
          AssetsData.onBoardingImage2,
          fit: BoxFit.fill,
        ),
        title: 'Learn Smartly',
        supTitle:
            r'It’s 2023 and it’s time to learn every quickly and smartly. All books are storage in cloud and you can access all of them from your laptop or PC.',
      ),
      OnBoardingPageBodyItem(
        height: height,
        width: width,
        image: Image.asset(
          AssetsData.onBoardingImage3,
          fit: BoxFit.fill,
        ),
        title: 'Book Has Power To Chnage Everything',
        supTitle:
            'We have true friend in our life and the books is that. Book has power to chnage yourself and make you more valueable.',
      ),
    ];

    return PageView.builder(
        itemCount: OnBoardingItemsList.length,
        controller: OnBoardingHelper.controller,
        itemBuilder: (BuildContext context, int index) {
          OnBoardingHelper.currentPageIndex = index;
          return OnBoardingItemsList[index];
        });
  }
}
