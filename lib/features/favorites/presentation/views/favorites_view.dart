import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
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
          } else if (state is FavoritesCubitSuccess) {
            return ListView.builder(
              itemCount:
                  BlocProvider.of<FavoritesCubit>(context).booklst.length,
              itemBuilder: (context, index) {
                BookEntity book =
                    BlocProvider.of<FavoritesCubit>(context).booklst[index];
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppStrings.kBookDetailsView, extra: book);
                  },
                  child: FavoritesListItem(
                    book: book,
                  ),
                );
              },
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
              BlocProvider.of<FavoritesCubit>(context).getFavoritesBooks();
            });
          }
        },
      ),
    );
  }
}
