import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/home/presentation/views/book_details_view.dart';
import 'package:book_worm/features/home/presentation/views/home_view.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboard_view.dart';
import 'package:book_worm/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static bool showHome = false;
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDeatialsView';
  static const kSearchView = '/SearchView';
// GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            showHome ? const HomeView() : const OnBoardView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
          path: kBookDetailsView,
          builder: (context, state) {
            BookEntity book = state.extra as BookEntity;
            return BookDetailsView(
              book: book,
            );
          }),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
