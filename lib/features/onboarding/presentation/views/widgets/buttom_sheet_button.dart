import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/home/presentation/views/home_view.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtomSheetButton extends StatelessWidget {
  const ButtomSheetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var providerDate = BlocProvider.of<OnBoardingCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: providerDate.getScreenWidth(context) * .2,
          vertical: providerDate.getScreenWidth(context) * .04),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll<Color>(AppColors.primaryColor),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
        ),
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showHome', true);
          GoRouter.of(context).go(AppStrings.kMainAppBody);
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: providerDate.getScreenHeight(context) * .02),
            child: const Text('Get Statrt'),
          ),
        ),
      ),
    );
  }
}
