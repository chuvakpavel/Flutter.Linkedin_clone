import 'package:flutter/material.dart';
import 'package:linkedin_clone/core/presentation/utility/responsive_layout.dart';

import '../../models/navigation_item.dart';
import '../../models/user.dart';
import '../utility/platform_provider.dart';
import '../utility/user_provider.dart';
import '../web/widgets/account_popup.dart';
import '../web/widgets/for_business_popup.dart';
import '../web/widgets/more_buttons_popup.dart';
import 'navigation_button.dart';

class AppTabBar extends StatefulWidget {
  const AppTabBar({
    super.key,
    this.selectedTab,
    this.onPageChanged,
    this.isMenuCompressed = false,
  });

  final int? selectedTab;

  final ValueChanged<int>? onPageChanged;

  final bool isMenuCompressed;

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with SingleTickerProviderStateMixin {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = PlatformProvider.of(context)?.isMobile ?? true;
    final isTightLayout = context.isTightLayout;
    final user = UserProvider.of(context).user;

    return Wrap(
      verticalDirection: isMobile ? VerticalDirection.down : VerticalDirection.up,
      runAlignment: WrapAlignment.center,
      children: [
        if (!isTightLayout || isMobile) ...[
          Container(
            height: 4,
            color: isMobile ? Colors.white : Colors.transparent,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final buttonWidth = (width - (isMobile ? 0 : 8)) / (isMobile ? 5 : 8);
                return Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      left: selectedTab * buttonWidth + (selectedTab > 5 ? 8 : 0),
                      child: Container(
                        width: buttonWidth,
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
        isMobile
            ? _MobileTabButtons(
                selectedTab: selectedTab,
                onTabChanged: (selectedTab) => setState(
                  () {
                    this.selectedTab = selectedTab;
                  },
                ),
              )
            : SizedBox(
                height: 50,
                child: _WebTabButtons(
                  user: user,
                  selectedTab: selectedTab,
                  onTabChanged: (selectedTab) => setState(
                    () {
                      this.selectedTab = selectedTab;
                    },
                  ),
                  isTightLayout: isTightLayout,
                  isMenuCompressed: widget.isMenuCompressed,
                ),
              ),
      ],
    );
  }
}

class _MobileTabButtons extends StatefulWidget {
  const _MobileTabButtons({
    required this.selectedTab,
    required this.onTabChanged,
  });

  final int selectedTab;

  final ValueChanged<int> onTabChanged;

  @override
  State<_MobileTabButtons> createState() => _MobileTabButtonsState();
}

class _MobileTabButtonsState extends State<_MobileTabButtons> {
  final tabs = [
    NavigationItem(
      icon: Icons.home,
      label: 'Home',
    ),
    NavigationItem(
      icon: Icons.people,
      label: 'My network',
      alternativeIcon: Icons.people_alt,
    ),
    NavigationItem(
      icon: Icons.add,
      label: 'Post',
    ),
    NavigationItem(
      icon: Icons.notifications,
      label: 'Notifications',
      alternativeIcon: Icons.notifications_active,
      badge: const Padding(
        padding: EdgeInsets.only(left: 14, bottom: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.circle, color: Color.fromRGBO(203, 17, 45, 1), size: 18),
            Text('7', style: TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.work,
      label: 'Jobs',
      alternativeIcon: Icons.cases_sharp,
    ),
  ];
  late final List<GlobalKey> _keys;

  @override
  void initState() {
    _keys = List.generate(tabs.length, (index) => GlobalKey());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: tabs.map(
          (tab) {
            return Expanded(
              child: NavigationButton(
                buttonKey: _keys[tabs.indexOf(tab)],
                navigationItem: tab,
                isSelected: widget.selectedTab == tabs.indexOf(tab),
                onPressed: () => widget.onTabChanged(
                  tabs.indexOf(tab),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class _WebTabButtons extends StatefulWidget {
  const _WebTabButtons({
    required this.user,
    required this.selectedTab,
    required this.onTabChanged,
    required this.isTightLayout,
    required this.isMenuCompressed,
  });

  final User user;

  final int selectedTab;

  final ValueChanged<int> onTabChanged;

  final bool isTightLayout;

  final bool isMenuCompressed;

  @override
  State<_WebTabButtons> createState() => _WebTabButtonsState();
}

class _WebTabButtonsState extends State<_WebTabButtons> {
  late final List<NavigationItem> tabs = [
    NavigationItem(
      icon: Icons.home,
      label: 'Home',
      badge: const Padding(
        padding: EdgeInsets.only(left: 14, bottom: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.circle, color: Color.fromRGBO(203, 17, 45, 1), size: 16),
            Icon(Icons.circle, color: Colors.white, size: 7),
          ],
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.people,
      label: 'My Network',
      alternativeIcon: Icons.people_alt,
    ),
    NavigationItem(
      icon: Icons.work,
      label: 'Jobs',
      alternativeIcon: Icons.cases_sharp,
    ),
    NavigationItem(
      icon: Icons.message,
      label: 'Messaging',
    ),
    NavigationItem(
      icon: Icons.notifications,
      label: 'Notifications',
      alternativeIcon: Icons.notifications_active,
      badge: const Padding(
        padding: EdgeInsets.only(left: 14, bottom: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.circle, color: Color.fromRGBO(203, 17, 45, 1), size: 18),
            Text('7', style: TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.account_circle,
      label: 'Me ▼',
      overlay: const AccountPopup(),
      imageIcon: widget.user.imageUrl,
    ),
    NavigationItem(
      icon: Icons.apps_sharp,
      label: 'For Business ▼',
      overlay: const ForBusinessPopup(),
    ),
    NavigationItem(
      icon: Icons.explore_outlined,
      label: 'Sales Nav',
      badge: const Padding(
        padding: EdgeInsets.only(left: 14, bottom: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.circle, color: Color.fromRGBO(203, 17, 45, 1), size: 18),
            Text('7', style: TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ),
      ),
    ),
  ];
  late final List<NavigationItem> tightTabs = [
    NavigationItem(
      icon: Icons.home,
      label: 'Home',
      badge: const Padding(
        padding: EdgeInsets.only(left: 14, bottom: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.circle, color: Color.fromRGBO(203, 17, 45, 1), size: 16),
            Icon(Icons.circle, color: Colors.white, size: 8),
          ],
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.work,
      label: 'Jobs',
      alternativeIcon: Icons.cases_sharp,
    ),
    NavigationItem(
      icon: Icons.message,
      label: 'Messaging',
    ),
    NavigationItem(
      icon: Icons.notifications,
      label: 'Notifications',
      alternativeIcon: Icons.notifications_active,
      badge: const Padding(
        padding: EdgeInsets.only(left: 14, bottom: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.circle, color: Color.fromRGBO(203, 17, 45, 1), size: 18),
            Text('7', style: TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.more_horiz,
      label: '',
      overlay: MoreButtonsPopup(
        tabs: [
          NavigationItem(
            icon: Icons.account_circle,
            label: 'Me ▼',
            overlay: const AccountPopup(),
            imageIcon: widget.user.imageUrl,
          ),
          NavigationItem(
            icon: Icons.apps_sharp,
            label: 'For Business ▼',
            overlay: const ForBusinessPopup(),
          ),
          NavigationItem(
            icon: Icons.explore_outlined,
            label: 'Sales Nav',
            badge: const Padding(
              padding: EdgeInsets.only(left: 14, bottom: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.circle, color: Color.fromRGBO(203, 17, 45, 1), size: 18),
                  Text('7', style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
          ),
        ],
      ),
    )
  ];
  late final List<GlobalKey> _keys;

  @override
  void initState() {
    _keys = List.generate(tabs.length, (index) => GlobalKey());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTabs = widget.isMenuCompressed ? tightTabs : tabs;
    return Row(
      children: currentTabs.map<Widget>(
        (tab) {
          return Expanded(
            child: NavigationButton(
              buttonKey: _keys[currentTabs.indexOf(tab)],
              navigationItem: tab,
              isSelected: widget.selectedTab == currentTabs.indexOf(tab),
              isTightLayout: widget.isTightLayout,
              overlayContent: tab.overlay,
              onPressed: () => widget.onTabChanged(
                currentTabs.indexOf(tab),
              ),
            ),
          );
        },
      ).toList()
        ..insert(
          currentTabs.length - 2,
          !widget.isMenuCompressed
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    width: 0.25,
                    height: 52,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox.shrink(),
        ),
    );
  }
}
