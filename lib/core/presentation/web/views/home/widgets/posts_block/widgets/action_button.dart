import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.title,
    required this.icon,
    this.padding,
    this.alternativeIcon,
  });

  final String? title;
  final Icon icon;
  final EdgeInsets? padding;
  final Widget? alternativeIcon;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black.withValues(alpha: 0.75));
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: kIsWeb ? 20.0 : 8.0),
      ),
      onPressed: () {},
      child: kIsWeb
          ? Row(
              children: [
                alternativeIcon ?? icon,
                if (title != null) ...[
                  const SizedBox(
                    width: 8,
                  ),
                  Text(title!, style: textStyle),
                ],
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                alternativeIcon ?? icon,
                if (title != null) ...[
                  const SizedBox(
                    width: 8,
                  ),
                  Text(title!, style: textStyle),
                ],
              ],
            ),
    );
  }
}
