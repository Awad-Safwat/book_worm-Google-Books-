import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNotSignedView extends StatelessWidget {
  const UserNotSignedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: AppColors.primaryColor,
        height: 60,
        minWidth: 120,
        onPressed: () {
          BlocProvider.of<FavoritesCubit>(context).getFavoritesBooks();
        },
        child: const Text(
          'Retry',
          style: Styels.textStyle18,
        ),
      ),
    );
  }
}
