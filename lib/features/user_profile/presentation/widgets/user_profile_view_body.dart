import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:book_worm/features/user_profile/presentation/manager/cubit/user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({super.key, required this.user});
  final UserEntity user;

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
                child: CircleAvatar(
                    radius: 90,
                    foregroundImage: NetworkImage(
                      user.userImageUrl,
                    )),
              ),
            ),
            const Gap(50),
            Row(
              children: [
                const Text(
                  'User Name : ',
                  style: Styels.textStyle20,
                ),
                Text(
                  user.userName,
                  style: Styels.textStyle18,
                ),
              ],
            ),
            const Gap(30),
            Row(
              children: [
                const Text(
                  'Email : ',
                  style: Styels.textStyle20,
                ),
                Text(
                  user.email,
                  style: Styels.textStyle18,
                ),
              ],
            ),
            const Gap(40),
            TextButton(
                onPressed: () async {
                  await BlocProvider.of<SignInCubit>(context).signOut().then(
                      (value) => BlocProvider.of<UserProfileCubit>(context)
                          .getUserData());
                },
                child: Text(
                  'Sign Out ..',
                  style: Styels.textStyle16.copyWith(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
