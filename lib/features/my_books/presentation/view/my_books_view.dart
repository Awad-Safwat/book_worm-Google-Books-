import 'package:book_worm/core/utils/setup_get_it_services.dart';
import 'package:book_worm/features/my_books/domain/my_books_use_cases/get_my_books_use_case.dart';
import 'package:book_worm/features/my_books/presentation/manager/get_my_books_cubit/get_my_books_cubit.dart';
import 'package:book_worm/features/my_books/presentation/widgets/my_books_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBooksView extends StatefulWidget {
  const MyBooksView({super.key});

  @override
  State<MyBooksView> createState() => _MyBooksViewState();
}

class _MyBooksViewState extends State<MyBooksView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetMyBooksCubit(getMyBooksUseCase: getIt.get<GetMyBooksUseCase>())
            ..getMyBooks(),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: MyBooksViewBlocConsumer(),
      ),
    );
  }
}
