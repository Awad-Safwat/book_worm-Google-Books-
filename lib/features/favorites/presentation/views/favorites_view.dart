import 'package:book_worm/features/favorites/presentation/widgets/favorites_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: FavoriteViewBlocConsumer(),
    );
  }
}
