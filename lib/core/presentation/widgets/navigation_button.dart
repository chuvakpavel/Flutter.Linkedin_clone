import 'package:flutter/material.dart';

import '../../models/navigation_item.dart';
import '../web/views/home/widgets/profile_block/widgets/profile_image.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.buttonKey,
    required this.navigationItem,
    required this.onPressed,
    this.isSelected = false,
    this.isTightLayout = false,
    this.overlayContent,
  });

  final GlobalKey buttonKey;

  final NavigationItem navigationItem;

  final bool isSelected;

  final VoidCallback onPressed;

  final bool isTightLayout;

  final Widget? overlayContent;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: buttonKey,
      style: TextButton.styleFrom(
        iconSize: 24,
        shape: const ContinuousRectangleBorder(),
        padding: EdgeInsets.zero,
        iconColor: isSelected
                  ? Colors.black
                  : const Color.fromRGBO(101, 101, 101, 1),
        foregroundColor: isSelected
                  ? Colors.black
                  : const Color.fromRGBO(101, 101, 101, 1),
        overlayColor: Colors.white,
        textStyle: isSelected? Theme.of(context).textTheme.bodySmall! : Theme.of(context).textTheme.labelSmall!,
      ),
      onPressed: () => overlayContent != null
          ? showOverlay(
              context,
              buttonKey,
              overlayContent ?? const SizedBox.shrink(),
            )
          : onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                navigationItem.imageIcon == null
                    ? Icon(
                        isSelected && navigationItem.alternativeIcon != null
                            ? navigationItem.alternativeIcon
                            : navigationItem.icon,
                      )
                    : ProfileImage(
                        imageUrl: navigationItem.imageIcon ?? '',
                        radius: 11,
                      ),
                if (navigationItem.badge != null)
                  Align(
                    alignment: Alignment.center,
                    child: navigationItem.badge ?? const SizedBox.shrink(),
                  ),
              ],
            ),
            if (!isTightLayout)
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 14),
                child: Text(
                  navigationItem.label,
                  softWrap: false,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void showOverlay(BuildContext context, GlobalKey key, Widget child) {
    final overlayState = Overlay.of(context);
    final windowSize = MediaQuery.of(context).size.width;
    final renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final buttonPoint = renderBox.localToGlobal(const Offset(0, 0));
    final buttonWidth = renderBox.size.width;
    final topPoint = renderBox.size.height + 28;

    final rightPoint = windowSize - buttonPoint.dx - buttonWidth;

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => overlayEntry.remove(),
              behavior: HitTestBehavior.translucent,
            ),
          ),
          Positioned(
            right: rightPoint,
            top: topPoint,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              child: child,
            ),
          ),
        ],
      ),
    );
    overlayState.insert(overlayEntry);
  }
}
