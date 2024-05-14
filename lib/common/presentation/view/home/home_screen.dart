// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/presentation/view/home/home_screen_scaffold.dart';
import 'package:gamemuncheol/common/presentation/view/home/widget/app_bar.dart';
import 'package:gamemuncheol/common/presentation/view/home/widget/tab_bar.dart';
import 'package:gamemuncheol/feature/feed/view/home_feed_screen.dart';
import 'package:gamemuncheol/feature/feed/view/recent_feed_screen.dart';

class HomeScreen extends HookConsumerWidget {
  HomeScreen({super.key});

  static const PATH = "/home_screen";
  static const ROUTE_NAME = "HomeScreen";

  final List<String> tabs = ["홈", "최근", "인기", "불판"];
  final List<Widget> tabViews = [
    const HomeFeedScreen(),
    const RecentFeedScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = usePageController();

    return HomeScreenScaffold(
      appBar: buildAppBar(),
      tabBar: buildTabBar(pageController: pageController, tabs: tabs),
      tabBarView:
          buildTabBarView(pageController: pageController, tabViews: tabViews),
    );
  }

  Widget buildAppBar() => const HomeAppBar();

  Widget buildTabBar({
    required PageController pageController,
    required List<String> tabs,
  }) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: HomeTabBarDelegate(pageController: pageController, tabs: tabs),
    );
  }

  Widget buildTabBarView({
    required PageController pageController,
    required List<Widget> tabViews,
  }) {
    return PageView(controller: pageController, children: tabViews);
  }
}