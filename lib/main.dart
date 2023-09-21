import 'package:book_worm/features/home/presentation/views/home_view.dart';
import 'package:book_worm/features/onboarding/presentation/views/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;

  runApp(BookWorm(showHome: showHome));
}

class BookWorm extends StatelessWidget {
  final bool showHome;
  const BookWorm({super.key, this.showHome = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'HKGrotesk',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'HKGrotesk',
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: Typography().white.apply(fontFamily: 'HKGrotesk'),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'HKGrotesk',
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: showHome ? const HomeView() : const OnBoardView(),
    );
  }
}
