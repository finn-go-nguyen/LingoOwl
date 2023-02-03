import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../features/home/model/home_navigation_item.dart';
import '../../features/home/view/featured_view.dart';
import '../../features/search/view/search_view.dart';
import '../../features/settings/view/settings/settings_screen.dart';
import '../../features/wishlist/view/wishlist_screen/wishlist_screen.dart';
import '../../router/app_router.dart';
import '../../widgets/state/unimplemented.dart';

class HomeNavigationItems {
  static const featured = HomeNavigationItem(
    route: LRoutes.home,
    path: '/featured',
    icon: FontAwesomeIcons.star,
    selectedIcon: FontAwesomeIcons.solidStar,
    tooltip: 'Featured',
    label: 'Featured',
    view: FeaturedView(),
  );

  static const search = HomeNavigationItem(
    route: LRoutes.search,
    path: '/search',
    icon: FontAwesomeIcons.magnifyingGlass,
    selectedIcon: FontAwesomeIcons.magnifyingGlass,
    tooltip: 'Search',
    label: 'Search',
    view: SearchView(),
  );

  static const myLearning = HomeNavigationItem(
    route: LRoutes.myLearning,
    path: '/learning',
    icon: FontAwesomeIcons.circlePlay,
    selectedIcon: FontAwesomeIcons.solidCirclePlay,
    tooltip: 'My learning',
    label: 'My learning',
    view: Unimplemented(),
  );

  static const wishlist = HomeNavigationItem(
    route: LRoutes.wishlist,
    path: '/wishlist',
    icon: FontAwesomeIcons.heart,
    selectedIcon: FontAwesomeIcons.solidHeart,
    tooltip: 'Wishlist',
    label: 'Wishlist',
    view: WishlistScreen(),
  );

  static const settings = HomeNavigationItem(
    route: LRoutes.settings,
    path: '/settings',
    icon: FontAwesomeIcons.circleUser,
    selectedIcon: FontAwesomeIcons.solidCircleUser,
    tooltip: 'Account',
    label: 'Account',
    view: SettingsView(),
  );

  static const items = <HomeNavigationItem>[
    featured,
    search,
    myLearning,
    wishlist,
    settings,
  ];
}
