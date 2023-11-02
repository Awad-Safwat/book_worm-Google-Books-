import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:book_worm/features/favorites/presentation/manager/add_delet_favorite_cubit/add_delete_favorite_cubit.dart';
import 'package:book_worm/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_details_widgets/rating_section.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedBookCard extends StatelessWidget {
  const SelectedBookCard({
    super.key,
    required this.book,
  });
  final dynamic book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .20,
          child: BookImage(imageUrl: book.imageUrl!),
        ),
        const SizedBox(
          width: 25,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 155),
                      child: Text(
                        book.bookTitle!,
                        style: Styels.textStyle14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    BlocConsumer<AddDeleteFavoriteCubit,
                        AddDeleteFavoriteState>(
                      listener: (context, state) async {
                        if (state is AddDeleteFavoriteCubitNotAuthorized) {
                          BlocProvider.of<SignInCubit>(context)
                              .signInGoogle()
                              .then((value) =>
                                  BlocProvider.of<AddDeleteFavoriteCubit>(
                                          context)
                                      .addToFavorites(bookId: book.bookId!));
                        }
                      },
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            if (state is AddDeleteFavoriteCubitIsFavorite) {
                              BlocProvider.of<AddDeleteFavoriteCubit>(context)
                                  .deleteFromFavorites(bookId: book.bookId!);
                            } else {
                              BlocProvider.of<AddDeleteFavoriteCubit>(context)
                                  .addToFavorites(bookId: book.bookId!);
                            }
                          },
                          icon: (state is AddDeleteFavoriteCubitIsFavorite)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 50,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                // Text(
                //   book.bookDiscreption!,
                //   overflow: TextOverflow.ellipsis,
                //   maxLines: 3,
                //   style: Styels.textStyle8.copyWith(
                //     color: Colors.white,
                //   ),
                // ),
                const SizedBox(
                  height: 5,
                ),
                RatingSection(
                  book: book,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
