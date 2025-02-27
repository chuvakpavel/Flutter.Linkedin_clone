import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GameButton extends StatelessWidget {
  const GameButton({super.key, required this.iconPath, required this.title, required this.description});
  final String iconPath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black26,
      ),
      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(iconPath),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headlineSmall!),
                      Text(description, style: Theme.of(context).textTheme.labelSmall!),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black87,)
          ],
        ),
      ),
    );
  }
}