import 'package:book_worm/features/onboarding/presentation/views/onboarding_cubit/on_boarding_cubit.dart';
import 'package:book_worm/features/onboarding/presentation/views/widgets/buttom_sheet_button.dart';
import 'package:book_worm/features/onboarding/presentation/views/widgets/buttom_sheet_pageindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardPageBottomSheet extends StatelessWidget {
  const OnBoardPageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .14,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          if (state is OnBoardingScrolled) {
            return const Center(
              child: Column(
                children: [
                  ButtomSheetPageIndicator(),
                  ButtomSheetButton(),
                ],
              ),
            );
          } else {
            return Container(
              alignment: Alignment.topCenter,
              child: const ButtomSheetPageIndicator(),
            );
          }
        },
      ),
    );
  }
}
