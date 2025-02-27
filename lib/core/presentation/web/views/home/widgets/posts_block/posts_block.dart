import 'package:flutter/material.dart';

import '../../../../../../models/post.dart';
import '../../../../../../models/user.dart';
import '../../../../../utility/platform_provider.dart';
import '../../../../../utility/user_provider.dart';
import 'post/post_view.dart';
import 'views/create_post_view.dart';
import 'views/filter_view.dart';

class PostsBlock extends StatelessWidget {
  PostsBlock({
    super.key,
    this.minWidth,
    this.maxWidth,
  });

  final double? minWidth;
  final double? maxWidth;

  final List<Post> posts = [
    Post(
      "🎮 Friends, we continue developing a game on .NET MAUI!\n"
          "If you haven’t seen Part 1️⃣ (https://lnkd.in/ehiCAAt9) yet, be sure to check it out: we worked on animations for our Hydra 🐉 .\n"
          "But that’s just the beginning! 🚀 \n"
          "In this new part, we dive into movement mechanics 🏃\n"
          "How to make the character respond smoothly to your taps❓ \n"
          "How to calculate direction and add realistic shadows❓ \n"
          "All this and more awaits you here: Part 2️⃣ (https://lnkd.in/eZXS5npp) 🙌 .\n "
          "💡 Join us to not only learn how to create an engaging 2D game, but also level up your development skills! 💻 🕹️ 📱 \n\n"
          "Part 1️⃣  (https://lnkd.in/ehiCAAt9)\n"
          "Part 2️⃣  (https://lnkd.in/eZXS5npp)\n\n"
          "#GameDev #MAUI #2DGame #Skia",
      "https://media.licdn.com/dms/image/v2/D4E22AQFFgTVkaxOeSg/feedshare-shrink_1280/B4EZSr956pG0Ao-/0/1738051922418?e=1742428800&v=beta&t=_RKRYY8FhXR3iSt5LBDGhJmzXVLmA7Cn132KKN4tGgM",
      2,
      4,
      '2w',
      User(
        'Igniscor',
        126,
        "https://media.licdn.com/dms/image/v2/C4E0BAQEFYW4DtfLdhg/company-logo_100_100/company-logo_100_100/0/1630629241128/xamazing_logo?e=1747267200&v=beta&t=rilFGWXMbXC8uoHx_6RGlan1Mxo1SlF96O_At-PihMA",
        'IT Company',
        'Bialystok, Poland',
      ),
    ),
    Post(
      "🎮 Friends, we continue developing a game on .NET MAUI!\n"
          "If you haven’t seen Part 1️⃣ (https://lnkd.in/ehiCAAt9) yet, be sure to check it out: we worked on animations for our Hydra 🐉 .\n"
          "But that’s just the beginning! 🚀 \n"
          "In this new part, we dive into movement mechanics 🏃\n"
          "How to make the character respond smoothly to your taps❓ \n"
          "How to calculate direction and add realistic shadows❓ \n"
          "All this and more awaits you here: Part 2️⃣ (https://lnkd.in/eZXS5npp) 🙌 .\n "
          "💡 Join us to not only learn how to create an engaging 2D game, but also level up your development skills! 💻 🕹️ 📱 \n\n"
          "Part 1️⃣  (https://lnkd.in/ehiCAAt9)\n"
          "Part 2️⃣  (https://lnkd.in/eZXS5npp)\n\n"
          "#GameDev #MAUI #2DGame #Skia",
      "https://media.licdn.com/dms/image/v2/D4E22AQFFgTVkaxOeSg/feedshare-shrink_1280/B4EZSr956pG0Ao-/0/1738051922418?e=1742428800&v=beta&t=_RKRYY8FhXR3iSt5LBDGhJmzXVLmA7Cn132KKN4tGgM",
      2,
      4,
      '2w',
      User(
        'Igniscor',
        126,
        "https://media.licdn.com/dms/image/v2/C4E0BAQEFYW4DtfLdhg/company-logo_100_100/company-logo_100_100/0/1630629241128/xamazing_logo?e=1747267200&v=beta&t=rilFGWXMbXC8uoHx_6RGlan1Mxo1SlF96O_At-PihMA",
        'IT Company',
        'Bialystok, Poland',
      ),
    ),
    Post(
      "🎮 Friends, we continue developing a game on .NET MAUI!\n"
          "If you haven’t seen Part 1️⃣ (https://lnkd.in/ehiCAAt9) yet, be sure to check it out: we worked on animations for our Hydra 🐉 .\n"
          "But that’s just the beginning! 🚀 \n"
          "In this new part, we dive into movement mechanics 🏃\n"
          "How to make the character respond smoothly to your taps❓ \n"
          "How to calculate direction and add realistic shadows❓ \n"
          "All this and more awaits you here: Part 2️⃣ (https://lnkd.in/eZXS5npp) 🙌 .\n "
          "💡 Join us to not only learn how to create an engaging 2D game, but also level up your development skills! 💻 🕹️ 📱 \n\n"
          "Part 1️⃣  (https://lnkd.in/ehiCAAt9)\n"
          "Part 2️⃣  (https://lnkd.in/eZXS5npp)\n\n"
          "#GameDev #MAUI #2DGame #Skia",
      "https://media.licdn.com/dms/image/v2/D4E22AQFFgTVkaxOeSg/feedshare-shrink_1280/B4EZSr956pG0Ao-/0/1738051922418?e=1742428800&v=beta&t=_RKRYY8FhXR3iSt5LBDGhJmzXVLmA7Cn132KKN4tGgM",
      2,
      4,
      '2w',
      User(
        'Igniscor',
        126,
        "https://media.licdn.com/dms/image/v2/C4E0BAQEFYW4DtfLdhg/company-logo_100_100/company-logo_100_100/0/1630629241128/xamazing_logo?e=1747267200&v=beta&t=rilFGWXMbXC8uoHx_6RGlan1Mxo1SlF96O_At-PihMA",
        'IT Company',
        'Bialystok, Poland',
      ),
    ),
    Post(
      "🎮 Friends, we continue developing a game on .NET MAUI!\n"
          "If you haven’t seen Part 1️⃣ (https://lnkd.in/ehiCAAt9) yet, be sure to check it out: we worked on animations for our Hydra 🐉 .\n"
          "But that’s just the beginning! 🚀 \n"
          "In this new part, we dive into movement mechanics 🏃\n"
          "How to make the character respond smoothly to your taps❓ \n"
          "How to calculate direction and add realistic shadows❓ \n"
          "All this and more awaits you here: Part 2️⃣ (https://lnkd.in/eZXS5npp) 🙌 .\n "
          "💡 Join us to not only learn how to create an engaging 2D game, but also level up your development skills! 💻 🕹️ 📱 \n\n"
          "Part 1️⃣  (https://lnkd.in/ehiCAAt9)\n"
          "Part 2️⃣  (https://lnkd.in/eZXS5npp)\n\n"
          "#GameDev #MAUI #2DGame #Skia",
      "https://media.licdn.com/dms/image/v2/D4E22AQFFgTVkaxOeSg/feedshare-shrink_1280/B4EZSr956pG0Ao-/0/1738051922418?e=1742428800&v=beta&t=_RKRYY8FhXR3iSt5LBDGhJmzXVLmA7Cn132KKN4tGgM",
      2,
      4,
      '2w',
      User(
        'Igniscor',
        126,
        "https://media.licdn.com/dms/image/v2/C4E0BAQEFYW4DtfLdhg/company-logo_100_100/company-logo_100_100/0/1630629241128/xamazing_logo?e=1747267200&v=beta&t=rilFGWXMbXC8uoHx_6RGlan1Mxo1SlF96O_At-PihMA",
        'IT Company',
        'Bialystok, Poland',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = PlatformProvider.of(context)?.isMobile ?? true;
    final user = UserProvider.of(context).user;

    final BoxConstraints constraints = BoxConstraints(minWidth: minWidth ?? 0.0, maxWidth: maxWidth ?? double.infinity);
    return isMobile
        ? SliverMainAxisGroup(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PostView(
                      constraints: constraints,
                      post: posts[index],
                    );
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          )
        : Column(
            children: [
              CreatePostView(
                user: user,
                constraints: constraints,
              ),
              FilterView(
                constraints: constraints,
              ),
              ...posts.map(
                (e) => PostView(
                  post: e,
                  constraints: constraints,
                ),
              ),
            ],
          );
  }
}
