import 'dart:async';

import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/onboarding/presentation/views/helper/helper.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboarding_cubit/on_boarding_cubit.dart';
import 'package:book_worm/features/onboarding/presentation/views/widgets/onboard_page_bottomsheet_body.dart';
import 'package:book_worm/features/onboarding/presentation/views/widgets/onboard_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: const Scaffold(
        body: OnBoardViewBody(),
        bottomSheet: OnBoardPageBottomSheet(),
      ),
    );
  }
}
