import 'package:flutter/material.dart';

class PostHeaderView extends StatelessWidget {
  const PostHeaderView({
    super.key,
    required this.imgUrl,
    required this.userName,
    required this.followersCount,
    required this.time,
  });

  final String imgUrl;
  final String userName;
  final int followersCount;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB( 16, 12, 0, 8),
          child: Row(
            children: [
              Image.network(
                imgUrl,
                width: 48,
              ),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: Theme.of(context).textTheme.headlineMedium!),
                  const SizedBox(width: 2,),
                  Text('$followersCount followers', style: Theme.of(context).textTheme.labelSmall!),
                  const SizedBox(width: 2,),
                  Row(
                    children: [
                      Text(time, style: Theme.of(context).textTheme.labelSmall!),
                      const SizedBox(width: 4,),
                      Icon(Icons.circle, size: 3, color: Colors.black.withValues(alpha: 0.6),),
                      const SizedBox(width: 4,),
                      Icon(Icons.public, size: 16, color: Colors.black.withValues(alpha: 0.6),),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.more_horiz, size: 20,),
        ),
        // IconButton(
        //   onPressed: (){},
        //   icon: Icon(Icons.close, size: 24,),
        // )
      ],
    );
  }
}