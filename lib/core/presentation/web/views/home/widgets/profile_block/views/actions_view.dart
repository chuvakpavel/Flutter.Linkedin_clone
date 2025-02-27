import 'package:flutter/material.dart';

import '../../../../../widgets/border_rounded_box.dart';
import '../../../../../widgets/clickable_region.dart';
import '../widgets/actions_item_view.dart';

class ActionsView extends StatefulWidget {
  const ActionsView({super.key, this.constraints});

  final BoxConstraints? constraints;

  @override
  State<ActionsView> createState() => _ActionsViewState();
}

class _ActionsViewState extends State<ActionsView> {
  bool isExpanded = false;
  bool isMobileView = false;

  @override
  void initState() {
    isMobileView = widget.constraints != null ? widget.constraints!.maxWidth > 225 : false;
    if (!isMobileView) isExpanded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: widget.constraints,
      child: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? const Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      // _ConnectionsPart(),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      _ActionsPart(),
                    ],
                  )
                : null,
          ),
          if (isMobileView)
            Container(
              margin: const EdgeInsets.fromLTRB(0, 18, 0, 14),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isExpanded ? "Show less" : "Show more",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black87),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 20, color: Colors.black),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ConnectionsPart extends StatefulWidget {
  const _ConnectionsPart();

  @override
  State<_ConnectionsPart> createState() => _ConnectionsPartState();
}

class _ConnectionsPartState extends State<_ConnectionsPart> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return BorderRoundedBox(
      child: ClickableRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Connections',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    shadows: [
                      const Shadow(
                          //color: Colors.red,
                          offset: Offset(0, -1))
                    ],
                    color: Colors.transparent,
                    fontWeight: FontWeight.bold,
                    decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
                Text(
                  'Grow your network',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.6),
                        offset: const Offset(0, -1),
                      )
                    ],
                    color: Colors.transparent,
                    fontWeight: FontWeight.bold,
                    decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.person_add_alt_1,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionsPart extends StatelessWidget {
  const _ActionsPart();

  @override
  Widget build(BuildContext context) {
    return const BorderRoundedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionsItem(
              icon: Icon(
                Icons.bookmark,
                size: 12,
              ),
              title: 'Saved items'),
          SizedBox(
            height: 16,
          ),
          ActionsItem(
              icon: Icon(
                Icons.groups,
                size: 12,
              ),
              title: 'Groups'),
          SizedBox(
            height: 16,
          ),
          ActionsItem(
              icon: Icon(
                Icons.event,
                size: 12,
              ),
              title: 'Events'),
        ],
      ),
    );
  }
}
