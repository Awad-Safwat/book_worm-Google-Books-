import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/features/onboarding/presentation/views/helper/helper.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboarding_cubit/on_boarding_cubit.dart';
import 'package:book_worm/features/onboarding/presentation/views/widgets/onboard_page_body_itme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardViewBody extends StatelessWidget {
  const OnBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var providerData = BlocProvider.of<OnBoardingCubit>(context);
    List<OnBoardingPageBodyItem> onBoardingItemsList = [
      OnBoardingPageBodyItem(
        height: providerData.getScreenHeight(context),
        width: providerData.getScreenWidth(context),
        image: Image.asset(
          AssetsData.onBoardingImage1,
          fit: BoxFit.fill,
        ),
        title: 'Only Books Can Help You',
        supTitle:
            'Books can help you to increase your knowledge and become more successfully.',
      ),
      OnBoardingPageBodyItem(
        height: providerData.getScreenHeight(context),
        width: providerData.getScreenWidth(context),
        image: Image.asset(
          AssetsData.onBoardingImage2,
          fit: BoxFit.fill,
        ),
        title: 'Learn Smartly',
        supTitle:
            r'It’s 2023 and it’s time to learn every quickly and smartly. All books are storage in cloud and you can access all of them from your laptop or PC.',
      ),
      OnBoardingPageBodyItem(
        height: providerData.getScreenHeight(context),
        width: providerData.getScreenWidth(context),
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
      itemCount: onBoardingItemsList.length,
      controller: BlocProvider.of<OnBoardingCubit>(context).controller,
      itemBuilder: (BuildContext context, int index) {
        providerData.currentPageIndex = index;

        return onBoardingItemsList[index];
      },
      onPageChanged: (value) {
        providerData.screenScrolling(value);
      },
    );
  }
}
