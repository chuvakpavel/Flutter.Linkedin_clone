import 'package:flutter/material.dart';

import '../../../../../../../models/user.dart';
import '../../../../../widgets/border_rounded_box.dart';
import '../widgets/action_button.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key, this.constraints, required this.user});

  final BoxConstraints? constraints;
  final User user;

  @override
  Widget build(BuildContext context) {
    return BorderRoundedBox(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      constraints: constraints,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  user.imageUrl,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1.0, color: Colors.black26),
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Start a post', style: Theme.of(context).textTheme.headlineSmall!),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                    title: 'Photo',
                    icon: Icon(
                      Icons.photo_size_select_actual_outlined,
                      color: Colors.blue,
                      size: 24,
                    )),
                ActionButton(
                  title: 'Video',
                  icon: Icon(
                    Icons.play_circle_fill,
                    color: Colors.green,
                    size: 24,
                  ),
                ),
                ActionButton(
                  title: 'Write article',
                  icon: Icon(
                    Icons.notes,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
