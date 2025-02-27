import 'package:flutter/material.dart';

import '../../widgets/app_web_header.dart';
import 'widgets/games_and_feed_block/games_and_feed_block.dart';
import 'widgets/posts_block/posts_block.dart';
import 'widgets/profile_block/profile_block.dart';
Widget getHomeView()  => const HomeWebView();

class HomeWebView extends StatefulWidget {
  const HomeWebView({super.key});

  @override
  State<HomeWebView> createState() => _HomeWebViewState();
}

class _HomeWebViewState extends State<HomeWebView> {
  final _scrollController = ScrollController();
  final _postsScrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _postsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SelectionArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            return Scaffold(
              appBar: const AppWebHeader(),
              body: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: Container(
                  color: const Color.fromRGBO(244, 242, 238, 1),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 24,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (width >= 767) ...[
                            const ProfileBlock(maxWidth: 225),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                          if (width < 767)
                            Expanded(
                              child: Column(
                                children: [
                                  // w > 1200 - 555, w < 990 - 471, w < 1200 && w > 990 - 397
                                  const ProfileBlock(
                                    minWidth: 485,
                                    maxWidth: 576,
                                  ),
                                  PostsBlock(
                                    maxWidth: width > 1200 ? 555 : (width < 990 ? (width < 767 ? 576 : 471) : 397),
                                    minWidth: width < 767 ? 485 : 0.0,
                                  ),
                                ],
                              ),
                            ),
                          if (width >= 767)
                            PostsBlock(
                              maxWidth: width > 1200 ? 555 : (width < 990 ? (width < 767 ? 576 : 471) : 397),
                              minWidth: width < 767 ? 485 : 0.0,
                            ),
                          if (width > 990) ...[
                            const SizedBox(
                              width: 20,
                            ),
                            const GamesAndFeedBlock(),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
