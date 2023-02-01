import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_constants/home_navigation_items.dart';
import '../../../widgets/common/scaffold.dart';
import 'home_controller.dart';

class ScaffoldWithBottomNavigationBar extends ConsumerWidget {
  const ScaffoldWithBottomNavigationBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const items = HomeNavigationItems.items;
    return LScaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          context.goNamed(items[index].route.name);
        },
        selectedIndex: ref
            .read(homeControllerProvider)
            .locationToTabIndex(GoRouter.of(context).location),
        destinations: List.generate(items.length, (index) {
          final item = items[index];
          return NavigationDestination(
            icon: FaIcon(item.icon),
            selectedIcon: FaIcon(item.selectedIcon),
            label: item.label,
            tooltip: item.tooltip,
          );
        }),
      ),
    );
  }
}
