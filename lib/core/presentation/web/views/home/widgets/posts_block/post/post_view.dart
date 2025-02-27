import 'package:flutter/material.dart';

import '../../../../../../../models/post.dart';
import '../../../../../../utility/platform_provider.dart';
import '../../../../../../utility/user_provider.dart';
import '../../../../../widgets/border_rounded_box.dart';
import 'post_actions_view.dart';
import 'post_header_view.dart';

class PostView extends StatelessWidget {
  const PostView({super.key, required this.constraints, required this.post});

  final BoxConstraints constraints;
  final Post post;

  @override
  Widget build(BuildContext context) {
    final user = UserProvider.of(context).user;
    final isMobile = PlatformProvider.of(context)?.isMobile ?? true;

    final tinyTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
      color: Colors.black.withValues(alpha: 0.6),
    );
    return BorderRoundedBox(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(bottom: 10),
      constraints: constraints,
      child: Column(
        children: [
          PostHeaderView(
            imgUrl: post.user.imageUrl,
            time: post.time,
            followersCount: post.user.followersCount,
            userName: post.user.name,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(post.text, style: Theme.of(context).textTheme.titleSmall!),
                if (post.mediaUrl != null) Image.network(post.mediaUrl!,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black.withValues(alpha: 0.1), // Border color
                        width: 1.0, // Border thickness
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.thumb_up_rounded,
                            color: Colors.blue,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            post.likesCount.toString(),
                            style: tinyTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        '${post.repostsCount} reposts',
                        style: tinyTextStyle,
                      )
                    ],
                  ),
                ),
                PostActionsView(
                  withTitle: constraints.maxWidth > 397,
                  profileImageUrl: user.imageUrl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
