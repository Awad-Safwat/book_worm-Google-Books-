import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_the_week_card_bloc_builder.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card.dart';
import 'package:book_worm/features/home/presentation/views/widgets/featured_books_list_bloc_builder.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_appBar.dart';
import 'package:book_worm/features/home/presentation/views/widgets/pobular_list_item.dart';
import 'package:book_worm/features/home/presentation/views/widgets/featured_books_list.dart';
import 'package:book_worm/features/home/presentation/views/widgets/popular_list_items_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeViewAppBar(),
        BookOfTheWeekCardBlocBuilder(),
        Expanded(
          child: CustomScrollView(
            slivers: [
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
                      FeatueredBooksListBlocBuilder(),
                      SizedBox(height: 25),
                      Text(
                        'Popular books',
                        style: Styels.textStyle20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              PobularListItemsBlocBuilder(),
            ],
          ),
        ),
      ],
    );
  }
}
