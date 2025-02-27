import 'package:flutter/material.dart';

import '../../../../../../../models/user.dart';
import '../widgets/follow_button.dart';

class RecommendedUserView extends StatelessWidget {
  const RecommendedUserView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              user.imageUrl,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: Theme.of(context).textTheme.headlineSmall!),
              Text(user.job, style: Theme.of(context).textTheme.labelSmall!),
              const SizedBox(
                height: 4,
              ),
              const FollowButton(),
            ],
          )
        ],
      ),
    );
  }
}
