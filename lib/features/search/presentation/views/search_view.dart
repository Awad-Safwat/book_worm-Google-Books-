import 'package:book_worm/core/errors/faluer.dart';
import 'package:book_worm/core/utils/setup_get_it_services.dart';
import 'package:book_worm/features/search/data/repos/search_repo_implementation.dart';
import 'package:book_worm/features/search/domain/use_cases/fetch_searched_books_use_case.dart';
import 'package:book_worm/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:book_worm/features/search/presentation/views/widgets/search_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchViewBody(),
    );
  }
}
