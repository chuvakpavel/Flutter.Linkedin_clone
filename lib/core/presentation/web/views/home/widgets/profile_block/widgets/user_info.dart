import 'package:flutter/material.dart';

import '../../../../../../../models/user.dart';
import '../../../../../../utility/platform_provider.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final isMobile = PlatformProvider.of(context)?.isMobile ?? true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Text(user.name, style: Theme.of(context).textTheme.headlineLarge),
            if (isMobile) Image.asset(
              'assets/images/linkedin_premium_logo.png',
              height: 12,
              width: 12,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          user.job,
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 4),
        Text(user.location, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 8),
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
      ],
    );
  }
}
