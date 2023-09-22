import 'package:book_worm/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class BookWorm extends StatelessWidget {
  const BookWorm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
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
    );
  }
}
