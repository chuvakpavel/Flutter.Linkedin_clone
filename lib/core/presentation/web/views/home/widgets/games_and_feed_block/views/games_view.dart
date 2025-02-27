import 'package:flutter/material.dart';

import '../../../../../widgets/border_rounded_box.dart';
import '../widgets/game_button.dart';

class GamesView extends StatelessWidget {
  const GamesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderRoundedBox(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
            child: Text("Today's puzzle games", style: Theme.of(context).textTheme.headlineMedium!),
          ),
          const SizedBox(height: 5,),
          const GameButton(iconPath: 'images/tango_logo.svg', title: 'Tango', description: 'Harmonize the grid',),
          const GameButton(iconPath: 'images/queens_logo.svg', title: 'Queens', description: 'Crown each region',),
          const GameButton(iconPath: 'images/pinpoint_logo.svg', title: 'Pinpoint', description: 'Guess the category',),
          const GameButton(iconPath: 'images/crossclimb_logo.svg', title: 'Crossclimb', description: 'Unlock a trivia ladder',),
        ],
      ),
    );
  }
}