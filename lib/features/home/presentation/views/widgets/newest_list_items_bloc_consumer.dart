import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_item.dart';
import 'package:book_worm/features/home/presentation/views/widgets/shimmer_loading/shimmer_newest_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PobularListItemsBlocConsumer extends StatelessWidget {
  const PobularListItemsBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksFalure) {
          showToast(state.massage);
        }
        if (state is NewestBooksPaginationFalure) {
          showToast(state.massage);
        }
      },
      builder: (context, state) {
        return BlocBuilder<NewestBooksCubit, NewestBooksState>(
          builder: (context, state) {
            if (state is NewestBooksFalure) {
              return SliverToBoxAdapter(
                child: ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      const ShimmerNewestListItem(),
                ),
              );
            } else if (state is NewestBooksSucsess ||
                state is NewestBooksPaginationLoading ||
                state is NewestBooksPaginationFalure) {
              // return const NewestBooksListViewBuilder();
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: BlocProvider.of<NewestBooksCubit>(context)
                      .newestBooksList
                      .length,
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 5, right: 20, left: 20),
                    child: NewestListItem(
                      book: BlocProvider.of<NewestBooksCubit>(context)
                          .newestBooksList[index],
                    ),
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      const ShimmerNewestListItem(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
