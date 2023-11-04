import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              child: Image.asset(AssetsData.personImage),
            ),
          ),
          const Gap(50),
          const Text(
            'Awad Safwat',
            style: Styels.textStyle18,
          ),
          const Gap(30),
          const Text(
            'awad.safwat1999@gmail.com',
            style: Styels.textStyle14,
          )
        ],
      ),
    );
  }
}
