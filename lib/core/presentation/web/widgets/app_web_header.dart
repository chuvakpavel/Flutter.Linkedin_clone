import 'package:flutter/material.dart';
import 'package:linkedin_clone/core/presentation/utility/responsive_layout.dart';

import '../../widgets/app_tab_bar.dart';
import 'search_field.dart';

class AppWebHeader extends StatefulWidget implements PreferredSizeWidget {
  const AppWebHeader({super.key});

  @override
  State<AppWebHeader> createState() => _AppWebHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

class _AppWebHeaderState extends State<AppWebHeader> {
  bool _tabsHided = false;

  void _hideTabs() {
    setState(() {
      _tabsHided = !_tabsHided;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final isTightLayout = context.isTightLayout;
          final isMenuCompressed = maxWidth < context.compressedTabsMaxWidth;
          return Container(
            color: Colors.white,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1200,
                ),
                child: SizedBox(
                  width: 1200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: isTightLayout
                            ? const EdgeInsets.only(left: 16)
                            : const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/linkedin_icon.png',
                              height: 34,
                              width: 34,
                            ),
                            const SizedBox(width: 8),
                            if (maxWidth > 1025) ...[
                              SearchField(
                                callback: () {},
                              ),
                            ] else ...[
                              SearchField(
                                isFullSized: false,
                                isLabelHidden: isTightLayout,
                                callback: _hideTabs,
                              ),
                            ],
                          ],
                        ),
                      ),
                      !_tabsHided
                          ?  Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: SizedBox(
                                width: isTightLayout ? (maxWidth > 740 ? 540 : (maxWidth > 520 ? 380 : 300)) : 630,
                                height: 52,
                                child: AppTabBar(
                                  isMenuCompressed: isMenuCompressed,
                                ),
                              ),
                          )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
