import 'package:flutter/material.dart';

import '../../../../../../../models/user.dart';
import '../widgets/profile_image.dart';
import '../widgets/user_info.dart';

class MobileProfileView extends StatelessWidget {
  const MobileProfileView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        ProfileImage(imageUrl: user.imageUrl),
        UserInfoView(user: user),
      ],
    );
  }
}
