import 'package:flutter/material.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10),
      backgroundColor: Colors.white,
      overlayColor: Colors.grey,
      foregroundColor: Colors.black,
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      iconColor: Colors.black,
      iconSize: 18,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile viewers',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '410',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Post impressions',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '7,386',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Container(height: 0.5, color: Colors.grey),
          TextButton(
            style: textButtonStyle,
            onPressed: () {},
            child: Row(
              spacing: 8,
              children: [
                Icon(Icons.square, color: Colors.yellow.shade700, size: 14),
                const Text(
                  'Go to Sales Navigator',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
