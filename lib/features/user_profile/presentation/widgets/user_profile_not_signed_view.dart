import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:book_worm/features/user_profile/presentation/manager/cubit/user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:gap/gap.dart';

class UserProfileNotSignedView extends StatelessWidget {
  const UserProfileNotSignedView({
    super.key,
  });

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
            const Center(
              child: CircleAvatar(
                radius: 90,
                foregroundImage: Svg(
                  AssetsData.personUnknown,
                ),
                backgroundColor: Colors.white,
              ),
            ),
            const Gap(50),
            const Text(
              'Name : ',
              style: Styels.textStyle20,
            ),
            const Gap(30),
            const Text(
              'Email : ',
              style: Styels.textStyle20,
            ),
            const Gap(50),
            Row(
              children: [
                const Text(
                  'You need to sign in with google',
                  style: Styels.textStyle14,
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () async {
                    await BlocProvider.of<SignInCubit>(context)
                        .signInGoogle()
                        .then(
                          (value) => BlocProvider.of<UserProfileCubit>(context)
                              .getUserData(),
                        );
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    foregroundImage: AssetImage(AssetsData.googleLogoImage),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
