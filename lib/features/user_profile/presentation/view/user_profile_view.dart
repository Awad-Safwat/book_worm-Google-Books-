import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:book_worm/features/user_profile/presentation/manager/cubit/user_profile_cubit.dart';
import 'package:book_worm/features/user_profile/presentation/widgets/user_profile_not_signed_view.dart';
import 'package:book_worm/features/user_profile/presentation/widgets/user_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userCubit = BlocProvider.of<UserProfileCubit>(context);
    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) async {
        if (state is UserProfileIsNotAuthorized) {
          userCubit.justEmitLoadingUser();
          await BlocProvider.of<SignInCubit>(context)
              .signInGoogle()
              .then((valu) {
            userCubit.getUserData();
          });
        }
      },
      builder: (context, state) {
        if (state is UserProfileSuccess) {
          return UserProfileViewBody(user: state.user);
        } else if (state is UserProfileIsNotSigned) {
          return const UserProfileNotSignedView();
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
