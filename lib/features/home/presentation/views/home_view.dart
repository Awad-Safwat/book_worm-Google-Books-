import 'package:book_worm/core/utils/api_service.dart';
import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/setup_get_it_services.dart';
import 'package:book_worm/features/home/data/data_sources/home_local_data_source.dart';
import 'package:book_worm/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_worm/features/home/data/repos/home_repo_implementation.dart';
import 'package:book_worm/features/home/domain/use_cases/fetch_featchered_books_usecase.dart';
import 'package:book_worm/features/home/domain/use_cases/fetch_newest_books_usecase.dart';
import 'package:book_worm/features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_worm/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (AppColors.gitBritness(context) == Brightness.light)
                ? const Svg(AssetsData.homeBackgroundImage)
                : const Svg(AssetsData.homeBackgroundImageDarkTheme),
            fit: BoxFit.cover,
          ),
        ),
        child: const HomeViewBody(),
      ),
    );
  }
}
