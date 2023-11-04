import 'package:book_worm/core/utils/app_colors.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(50),
            Center(
              child: CircleAvatar(
                radius: 95,
                backgroundColor: AppColors.primaryColor,
                child: const CircleAvatar(
                    radius: 90,
                    foregroundImage: AssetImage(
                      AssetsData.personImage,
                    )),
              ),
            ),
            const Gap(50),
            const Text(
              'User Name : Awad Safwat',
              style: Styels.textStyle20,
            ),
            const Gap(30),
            const Text(
              'Email : awad.safwat1999@gmail.com',
              style: Styels.textStyle18,
            )
          ],
        ),
      ),
    );
  }
}
