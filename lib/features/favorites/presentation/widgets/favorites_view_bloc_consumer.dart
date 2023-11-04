import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:book_worm/features/auth/presentation/views/widgets/user_not_signed_in_view.dart';
import 'package:book_worm/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:book_worm/features/favorites/presentation/widgets/favorites_list_item.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewBlocConsumer extends StatelessWidget {
  const FavoriteViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesCubitState>(
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
            itemCount: BlocProvider.of<FavoritesCubit>(context).booklst.length,
            itemBuilder: (context, index) {
              BookEntity book =
                  BlocProvider.of<FavoritesCubit>(context).booklst[index];
              return FavoritesListItems(book: book);
            },
          );
        } else if (state is FavoritesCubitUserNotSigned) {
          return const UserNotSignedView();
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
    );
  }
}
