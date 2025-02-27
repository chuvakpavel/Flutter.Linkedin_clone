import 'package:flutter/material.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key, this.constraints});
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.black26,
                height: 1,
                margin: const EdgeInsets.fromLTRB(0, 7.5, 16, 7.5),
              ),
            ),
            Text('Select feed view:', style: Theme.of(context).textTheme.labelSmall!),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Text('Most relevant first', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600)),
            ),
            const Icon(Icons.arrow_drop_down, size: 24),
          ],
        ),
      ),
    );
  }
}