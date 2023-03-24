import 'package:flutter/material.dart';

import '../../../../constants/app_constants/tab_items.dart';

class LectureTabBar extends StatelessWidget {
  const LectureTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _MySliverPersistentHeaderDelegate(
        TabBar(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          tabs: List.generate(
            TabItems.lecture.length,
            (index) => TabItems.lecture[index],
          ),
        ),
      ),
      pinned: true,
    );
  }
}

class _MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _MySliverPersistentHeaderDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          tabBar,
          const Spacer(),
          // IconButton(
          //   onPressed: () => showNotImplementedAlertDialog(context: context),
          //   icon: const Icon(
          //     Icons.download_for_offline,
          //   ),
          // )
        ],
      ),
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
