import 'package:flutter/material.dart';

import '../../../models/navigation_item.dart';
import '../../widgets/navigation_button.dart';

class MoreButtonsPopup extends StatelessWidget {
  const MoreButtonsPopup({
    super.key,
    required this.tabs,
  });

  final List<NavigationItem> tabs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: tabs.map<Widget>(
          (tab) {
            return Expanded(
              child: NavigationButton(
                buttonKey: GlobalKey(),
                navigationItem: tab,
                isTightLayout: true,
                onPressed: () {},
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
