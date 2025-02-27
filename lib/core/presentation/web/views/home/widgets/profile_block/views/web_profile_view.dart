import 'package:flutter/material.dart';

import '../../../../../../../models/user.dart';
import '../widgets/profile_image.dart';
import '../widgets/user_info.dart';

class WebProfileView extends StatelessWidget {
  const WebProfileView({super.key, required this.user, required this.width});

  final User user;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.network(
              "https://media.licdn.com/dms/image/v2/D4D16AQFHVe1P2BarWA/profile-displaybackgroundimage-shrink_350_1400/profile-displaybackgroundimage-shrink_350_1400/0/1687245734945?e=1746057600&v=beta&t=Zg3qxYUjekRFtiWgVZuWMWq0eFuDc2AvEfpzFHdYywE",
              fit: BoxFit.fitWidth,
              height: width > 225 ? 100 : 58,
              width: double.infinity,
            ),
            Positioned(
              top: width > 225 ? 70 : 34,
              left: 16,
              child: CircleAvatar(
                radius: 36,
                backgroundColor: Colors.white,
                child: ProfileImage(
                  imageUrl: user.imageUrl,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
          child: UserInfoView(user: user),
        ),
      ],
    );
  }
}
