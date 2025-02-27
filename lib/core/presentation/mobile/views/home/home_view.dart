import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../web/views/home/widgets/posts_block/posts_block.dart';
import '../../../widgets/app_tab_bar.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/app_header.dart';
Widget getHomeView()  => const HomeView();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;
  bool _isBottomBarVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isBottomBarVisible) {
        setState(() {
          _isBottomBarVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!_isBottomBarVisible) {
        setState(() {
          _isBottomBarVisible = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Container(
        color: Colors.grey.withAlpha(50),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const AppHeader(),
              PostsBlock(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppTabBar(),
    );
  }
}
