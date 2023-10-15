import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/featured_books_list.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_featured_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatueredBooksListBlocConsumer extends StatelessWidget {
  const FeatueredBooksListBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksFalure) {
          showToast(state.massage);
        }
        if (state is FeaturedBooksPaginationFalure) {
          showToast(state.massage);
        }
      },
      builder: (context, state) {
        return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
          builder: (context, state) {
            if (state is FeaturedBooksFalure) {
              return ShimmerFeatueredBooksList(
                screenSize: MediaQuery.sizeOf(context),
              );
            } else if (state is FeaturedBooksSucsess ||
                state is FeaturedBooksPaginationFalure ||
                state is FeaturedBooksPaginationLoading) {
              return FeatueredBooksList(
                books: BlocProvider.of<FeaturedBooksCubit>(context)
                    .featuredBooksLst,
              );
            } else {
              return ShimmerFeatueredBooksList(
                screenSize: MediaQuery.sizeOf(context),
              );
            }
          },
        );
      },
    );
  }
}
