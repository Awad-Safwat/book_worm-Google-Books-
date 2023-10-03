import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/book_worm.dart';
import 'package:book_worm/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;
  AppRouter.showHome = showHome;

  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeatueredBox);
  await Hive.openBox(kNewestBox);
  runApp(const BookWorm());
}
