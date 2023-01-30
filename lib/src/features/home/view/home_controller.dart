import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_constants/home_navigation_items.dart';

final homeControllerProvider = Provider<HomeController>((ref) {
  return HomeController();
});

class HomeController {
  HomeController();

  int locationToTabIndex(String location) {
    final index = HomeNavigationItems.items
        .indexWhere((t) => location.startsWith(t.path));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }
}
