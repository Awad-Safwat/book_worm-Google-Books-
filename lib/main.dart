import 'package:book_worm/core/utils/app_router.dart';
import 'package:book_worm/features/book_worm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;
  AppRouter.showHome = showHome;

  runApp(const BookWorm());
}
