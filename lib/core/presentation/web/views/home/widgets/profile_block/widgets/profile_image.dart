import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.imageUrl, this.radius});

  final String imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 34,
      backgroundImage: NetworkImage(
        imageUrl,
      ),
    );
  }
}
