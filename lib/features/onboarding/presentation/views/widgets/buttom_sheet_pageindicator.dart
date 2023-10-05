import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ButtomSheetPageIndicator extends StatelessWidget {
  const ButtomSheetPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: BlocProvider.of<OnBoardingCubit>(context).controller,
      count: 3,
      effect: ExpandingDotsEffect(
          expansionFactor: 5,
          activeDotColor: AppColors.primaryColor,
          dotHeight: 6,
          dotWidth: 6,
          spacing: MediaQuery.of(context).size.width * .02),
    );
  }
}
