import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:book_worm/features/favorites/presentation/manager/add_delet_favorite_cubit/add_delete_favorite_cubit.dart';
import 'package:book_worm/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:book_worm/features/favorites/presentation/widgets/favorites_listItem.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<FavoritesCubit, FavoritesCubitState>(
        builder: (context, state) {
          if (state is FavoritesCubitFailure) {
            return Center(
              child: Text(state.faluer.massege),
            );
          } else if (state is FavoritesCubitSuccess ||
              state is FavoritesCubitPaginationLoading ||
              state is FavoritesCubitPaginationfaluer) {
            return ListView.builder(
              controller: BlocProvider.of<FavoritesCubit>(context)
                  .favoritesScrollController,
              itemCount:
                  BlocProvider.of<FavoritesCubit>(context).booklst.length,
              itemBuilder: (context, index) {
                BookEntity book =
                    BlocProvider.of<FavoritesCubit>(context).booklst[index];
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<AddDeleteFavoriteCubit>(context)
                        .checkIsFavoriteBook(book: book);
                    GoRouter.of(context)
                        .push(AppStrings.kBookDetailsView, extra: book);
                  },
                  child: FavoritesListItem(
                    book: book,
                  ),
                );
              },
            );
          } else if (state is FavoritesCubitUserNotSigned) {
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        listener: (context, state) async {
          if (state is FavoritesCubitNotAuthorized) {
            BlocProvider.of<FavoritesCubit>(context).justEmitLoading();
            await BlocProvider.of<SignInCubit>(context)
                .signInGoogle()
                .then((value) {
              BlocProvider.of<FavoritesCubit>(context).getFavoritesBooks(
                  pageNumber:
                      BlocProvider.of<FavoritesCubit>(context).pageNumber);
            });
          }
          if (state is FavoritesCubitUserNotSigned) {
            if (context.mounted) {
              return showSignInDialog(context);
            }
          }
          if (state is FavoritesCubitSuccess) {
            if (context.mounted) {
              BlocProvider.of<FavoritesCubit>(context)
                  .favoritesScrollControllerSetUp(context);
            }
          }
          if (state is FavoritesCubitPaginationfaluer) {
            showToast(state.faluer.massege);
          }
          if (state is FavoritesCubitSuccess) {
            BlocProvider.of<FavoritesCubit>(context).pageNumber++;
          }
        },
      ),
    );
  }
}
