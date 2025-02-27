import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: OutlinedButton(
        onPressed: (){},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          side: BorderSide(width: isHovered ? 2 : 1, color: isHovered ? Colors.black87 : Colors.black54),
          foregroundColor: isHovered ? Colors.black87 : Colors.black54,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        child: Row(
          children: [
            Icon(Icons.add, size: 20, color: isHovered? Colors.black : Colors.black.withValues(alpha: 0.7),),
            //const SizedBox(width: 3,),
            Text('Follow', style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: isHovered? Colors.black : Colors.black.withValues(alpha: 0.7))),
          ],
        ),
      ),
    );
  }
}