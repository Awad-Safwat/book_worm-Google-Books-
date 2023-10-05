import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/book_details_view.dart';
import 'package:book_worm/features/home/presentation/views/home_view.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_web_view.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboard_view.dart';
import 'package:book_worm/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static bool showHome = false;

// GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            showHome ? const HomeView() : const OnBoardView(),
      ),
      GoRoute(
        path: AppStrings.kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //     path: AppStrings.kBookDetailsView,
      //     builder: (context, state) {
      //       BookEntity book = state.extra as BookEntity;
      //       return BookDetailsView(
      //         book: book,
      //       );
      //     }),
      GoRoute(
        path: AppStrings.kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
          path: AppStrings.kBookWebView,
          builder: (context, state) {
            String bookUrl = state.extra as String;

            return BookWebView(
              bookUrl: bookUrl,
            );
          }),
      GoRoute(
        path: AppStrings.kBookDetailsView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          BookEntity book = state.extra as BookEntity;
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: BookDetailsView(
              book: book,
            ),
            transitionDuration: const Duration(milliseconds: 850),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
