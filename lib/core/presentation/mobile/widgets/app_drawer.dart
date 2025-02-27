import 'package:flutter/material.dart';

import '../../utility/user_provider.dart';
import '../../web/views/home/widgets/profile_block/views/mobile_profile_view.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.of(context).user;

    final textButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      backgroundColor: Colors.white,
      overlayColor: Colors.grey,
      foregroundColor: Colors.black,
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      iconColor: Colors.black,
      iconSize: 18,
    );

    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  MobileProfileView(user: user),
                  Container(height: 0.5, color: Colors.grey),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '410',
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text: ' profile viewers',
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '7,386',
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' post impressions',
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ],
                    ),
                  ),
                  Container(height: 0.5, color: Colors.grey),
                  Text('Manage pages', style: Theme.of(context).textTheme.labelSmall),
                  Row(
                    spacing: 4,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          "https://media.licdn.com/dms/image/v2/C4E0BAQEFYW4DtfLdhg/company-logo_200_200/company-logo_200_200/0/1630629241128/xamazing_logo?e=1746662400&v=beta&t=VGJjtR61fedn9MxTGJi3l15nsAjaVY126Wpjv0Idy0U",
                          height: 20.0,
                          width: 20.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        'Igniscor',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(height: 0.5, color: Colors.grey),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  TextButton(
                    style: textButtonStyle,
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('Puzzle Games'),
                      ],
                    ),
                  ),
                  TextButton(
                    style: textButtonStyle,
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('Saved posts'),
                      ],
                    ),
                  ),
                  TextButton(
                    style: textButtonStyle,
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('Groups'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 0.5,
                color: Colors.grey,
              ),
            ),
            TextButton(
              style: textButtonStyle,
              onPressed: () {},
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.square, color: Colors.yellow.shade600, size: 22),
                  const Text(
                    'Premium features',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            TextButton(
              style: textButtonStyle,
              onPressed: () {},
              child: const Row(
                spacing: 8,
                children: [
                  Icon(Icons.settings, color: Colors.black54, size: 22),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
