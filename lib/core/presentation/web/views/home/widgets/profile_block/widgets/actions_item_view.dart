import 'package:flutter/material.dart';

import '../../../../../widgets/clickable_region.dart';

class ActionsItem extends StatefulWidget {
  const ActionsItem({super.key, required this.icon, required this.title});

  final Icon icon;
  final String title;

  @override
  State<ActionsItem> createState() => _ActionsItemState();
}

class _ActionsItemState extends State<ActionsItem> {
  late bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ClickableRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Row(
        children: [
          widget.icon,
          const SizedBox(
            width: 8,
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              shadows: [const Shadow(offset: Offset(0, -1))],
              color: Colors.transparent,
              fontWeight: FontWeight.bold,
              decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
