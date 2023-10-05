import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/core/utils/app_strings.dart';
import 'package:book_worm/core/utils/bloc_observer/app_bloc_observer.dart';
import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/setup_get_it_services.dart';
import 'package:book_worm/features/book_worm.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:book_worm/features/search/domain/entities/searched_book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;
  AppRouter.showHome = showHome;
  settingUpGetItServices();
  Bloc.observer = AppBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AppStrings.kFeatueredBox);
  await Hive.openBox<BookEntity>(AppStrings.kNewestBox);
  await Hive.openBox<SearchedBookEntity>(AppStrings.kHistoryBox);

  runApp(const BookWorm());
}
