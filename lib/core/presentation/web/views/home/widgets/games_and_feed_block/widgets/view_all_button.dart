import 'package:flutter/material.dart';

class ViewAllButton extends StatefulWidget {
  const ViewAllButton({super.key});

  @override
  State<ViewAllButton> createState() => _ViewAllButtonState();
}

class _ViewAllButtonState extends State<ViewAllButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextButton(
        onPressed: (){},
        style: OutlinedButton.styleFrom(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          // side: BorderSide(width: isHovered ? 2 : 1, color: isHovered ? Colors.black87 : Colors.black54),
          // foregroundColor: isHovered ? Colors.black87 : Colors.black54,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('View all recommendations', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: isHovered? Colors.black : Colors.black.withValues(alpha: 0.7))),
            const SizedBox(width: 2,),
            Icon(Icons.arrow_forward, size: 20, color: isHovered? Colors.black : Colors.black.withValues(alpha: 0.7),),
          ],
        ),
      ),
    );
  }
}