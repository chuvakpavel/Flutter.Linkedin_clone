import 'package:flutter/material.dart';

class CompanyInfoView extends StatelessWidget {
  const CompanyInfoView({super.key});

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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Notifications',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
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
                'Page visitors',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                '60',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Container(height: 0.5, color: Colors.grey),
          Text(
            'Grow your business',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.grey),
          ),
          TextButton(
            style: textButtonStyle,
            onPressed: () {},
            child: const Row(
              spacing: 4,
              children: [
                Icon(Icons.gps_fixed, color: Colors.black, size: 14),
                Text(
                  'Try Campaign Manager',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}
