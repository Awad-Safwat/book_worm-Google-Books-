import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_the_week_card_bloc_builder.dart';
import 'package:book_worm/features/home/presentation/views/widgets/featured_books_list_bloc_consumer.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_appBar.dart';
import 'package:book_worm/features/home/presentation/views/widgets/newest_list_items_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController =
        BlocProvider.of<NewestBooksCubit>(context).newestListController;
    setupScrollController(
      context,
      scrollController,
      () {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            if (!BlocProvider.of<NewestBooksCubit>(context)
                .paginationIsLoading) {
              BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
                  pageNumber:
                      BlocProvider.of<NewestBooksCubit>(context).pageNumber++);
            }
          }
        }
      },
    );

    return Column(
      children: [
        const HomeViewAppBar(),
        const BookOfTheWeekCardBlocBuilder(),
        Expanded(
          child: CustomScrollView(
            controller: scrollController,
            slivers: const [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 35),
                      Text(
                        'Featured Books',
                        style: Styels.textStyle20,
                      ),
                      SizedBox(height: 20),
                      FeatueredBooksListBlocConsumer(),
                      SizedBox(height: 25),
                      Text(
                        'Newest Books',
                        style: Styels.textStyle20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              PobularListItemsBlocConsumer(),
            ],
          ),
        ),
      ],
    );
  }
}
