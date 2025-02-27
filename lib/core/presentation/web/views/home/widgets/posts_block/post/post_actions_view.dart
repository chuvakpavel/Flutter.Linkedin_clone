import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../profile_block/widgets/profile_image.dart';
import '../widgets/action_button.dart';

class PostActionsView extends StatelessWidget {
  const PostActionsView({
    super.key,
    this.withTitle = true,
    required this.profileImageUrl,
  });

  final bool withTitle;
  final String profileImageUrl;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets defaultPadding = EdgeInsets.symmetric(horizontal: 10.0, vertical: kIsWeb ? 20.0 : 8.0);

    return Padding(
      padding: withTitle
          ? const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            )
          : const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(
            icon: const Icon(Icons.account_circle),
            alternativeIcon: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                ProfileImage(
                  imageUrl: profileImageUrl ?? '',
                  radius: 12,
                ),
                const Text(
                  '▼',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ],
            ),
          ),
          ActionButton(
            title: withTitle ? 'Like' : null,
            icon: const Icon(Icons.thumb_up_alt_outlined, size: 16, color: Colors.black),
            padding: defaultPadding,
          ),
          ActionButton(
            title: withTitle ? 'Comment' : null,
            icon: const Icon(Icons.comment_outlined, size: 16, color: Colors.black),
            padding: defaultPadding,
          ),
          ActionButton(
            title: withTitle ? 'Repost' : null,
            icon: const Icon(Icons.refresh, size: 16, color: Colors.black),
            padding: defaultPadding,
          ),
          ActionButton(
            title: withTitle ? 'Send' : null,
            icon: const Icon(Icons.send, size: 16, color: Colors.black),
            padding: defaultPadding,
          ),
        ],
      ),
    );
  }
}
