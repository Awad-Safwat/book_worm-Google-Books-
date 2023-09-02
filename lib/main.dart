import 'package:book_worm/features/onboarding/presentation/views/onboard_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookWorm());
}

class BookWorm extends StatelessWidget {
  const BookWorm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardView(),
    );
  }
}
