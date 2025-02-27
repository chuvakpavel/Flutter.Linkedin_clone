import 'package:flutter/material.dart';

import '../../utility/user_provider.dart';
import '../../web/views/home/widgets/profile_block/widgets/profile_image.dart';
import '../views/search/search_view.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    final user = UserProvider.of(context).user;

    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: kToolbarHeight,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileImage(
                      imageUrl: user.imageUrl,
                      radius: 18,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withAlpha(25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            const Icon(Icons.search, size: 22, color: Colors.black54),
                            Text(
                              'Search',
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const SearchView()),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              const Icon(Icons.align_horizontal_left, size: 24, color: Color.fromRGBO(101, 101, 101, 1)),
              const Icon(Icons.message, size: 24, color: Color.fromRGBO(101, 101, 101, 1)),
            ],
          ),
        ),
      ),
    );
  }
}
