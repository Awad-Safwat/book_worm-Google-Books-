import 'package:book_worm/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:book_worm/features/search/presentation/views/widgets/history_body_bloc_builder.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_result_list_section.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:book_worm/features/search/presentation/views/widgets/shimmer_searched_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBodyBlocBuilder extends StatelessWidget {
  const SearchViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchFaluer) {
          return const HistoryBodyBlocBuilder();
        } else if (state is SearchSucces) {
          return SearchResultListSection(books: state.books);
        } else {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const ShimmerSearchedListItem(),
            ),
          );
        }
      },
    );
  }
}
