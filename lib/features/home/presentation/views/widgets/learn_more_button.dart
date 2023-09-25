import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30,
      color: Colors.transparent,
      elevation: 0,
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: const Text(
        'Learn More',
        style: Styels.textStyle10,
      ),
    );
  }
}
