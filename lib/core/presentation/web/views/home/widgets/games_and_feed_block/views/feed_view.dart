import 'package:flutter/material.dart';

import '../../../../../../../models/user.dart';
import '../../../../../widgets/border_rounded_box.dart';
import '../widgets/view_all_button.dart';
import 'recommended_user_view.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});

  final List<User> users = [
    User(
      'Julian Airapetov',
      5,
      "https://media.licdn.com/dms/image/v2/D4E03AQEzpoRRdMd5Pg/profile-displayphoto-shrink_200_200/B4EZS7NDPhGYAY-/0/1738307548699?e=1744243200&v=beta&t=o27Q7NcyI1fNMdJuUlEMufT7ijjOtnM44TujwML479Q",
      'Flutter Developer',
      'Bialystok, Poland',
    ),
    User(
      'Igniscor',
      126,
      "https://media.licdn.com/dms/image/v2/C4E0BAQEFYW4DtfLdhg/company-logo_100_100/company-logo_100_100/0/1630629241128/xamazing_logo?e=1747267200&v=beta&t=rilFGWXMbXC8uoHx_6RGlan1Mxo1SlF96O_At-PihMA",
      'IT Company',
      'Bialystok, Poland',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BorderRoundedBox(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add to your feed", style: Theme.of(context).textTheme.headlineMedium!),
              IconButton(
                onPressed: () {},
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.info,
                  size: 16,
                ),
              ),
            ],
          ),
          ...users.map((user) => RecommendedUserView(user: user)),
          const SizedBox(height: 12),
          const ViewAllButton(),
        ],
      ),
    );
  }
}
