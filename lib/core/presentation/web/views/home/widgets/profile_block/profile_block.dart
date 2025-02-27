import 'package:flutter/material.dart';

import '../../../../../utility/user_provider.dart';
import '../../../../widgets/border_rounded_box.dart';
import '../company_block/views/company_view.dart';
import '../statistics_block/views/statistics_view.dart';
import 'views/actions_view.dart';
import 'views/web_profile_view.dart';

class ProfileBlock extends StatelessWidget {
  const ProfileBlock({
    super.key,
    this.minWidth,
    this.maxWidth,
  });

  final double? minWidth;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.of(context).user;

    final BoxConstraints constraints = BoxConstraints(minWidth: minWidth ?? 0.0, maxWidth: maxWidth ?? double.infinity);
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        BorderRoundedBox(
          padding: const EdgeInsets.all(0),
          constraints: constraints,
          child: WebProfileView(
            user: user,
            width: minWidth ?? maxWidth ?? 0.0,
          ),
        ),
        BorderRoundedBox(
          padding: EdgeInsets.zero,
          constraints: constraints,
          child: const StatisticsView(),
        ),
        BorderRoundedBox(
          padding: EdgeInsets.zero,
          constraints: constraints,
          child: CompanyView(
            user: user,
            width: minWidth ?? maxWidth ?? 0.0,
          ),
        ),
        ActionsView(constraints: constraints),
      ],
    );
  }
}
