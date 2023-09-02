import 'dart:async';

import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/onboarding/presentation/views/helper/helper.dart';
import 'package:book_worm/features/onboarding/presentation/views/widgets/onboard_page_bottomsheet_body.dart';
import 'package:book_worm/features/onboarding/presentation/views/widgets/onboard_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardViewBody(),
      bottomSheet: OnBoardPageBottomSheet(),
    );
  }
}
