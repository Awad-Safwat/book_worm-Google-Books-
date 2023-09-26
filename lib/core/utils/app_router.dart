import 'package:book_worm/features/home/presentation/views/book_details_view.dart';
import 'package:book_worm/features/home/presentation/views/home_view.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboard_view.dart';
import 'package:book_worm/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static bool showHome = false;
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDetailsView';
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
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
