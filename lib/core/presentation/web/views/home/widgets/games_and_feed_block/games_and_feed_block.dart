import 'package:flutter/material.dart';
import 'views/feed_view.dart';
import 'views/games_view.dart';

class GamesAndFeedBlock extends StatelessWidget {
  const GamesAndFeedBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GamesView(),
        const SizedBox(height: 8,),
        FeedView(),
      ],
    );
  }
}