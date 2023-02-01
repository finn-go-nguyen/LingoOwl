import '../../features/settings/model/setting.dart';
import '../../router/app_router.dart';

class ProfileSettings {
  static const list = <LSetting>[
    LSetting(
      'View public profile',
      route: LRoutes.unimplemented,
    ),
    LSetting(
      'Profile',
      route: LRoutes.profile,
    ),
    LSetting(
      'Photo',
      route: LRoutes.photo,
    ),
    LSetting(
      'Account security',
      route: LRoutes.accountSecurity,
    ),
    LSetting(
      'Subscriptions',
      route: LRoutes.unimplemented,
    ),
    LSetting(
      'Payment methods',
      route: LRoutes.unimplemented,
    ),
    LSetting(
      'Privacy',
      route: LRoutes.unimplemented,
    ),
    LSetting(
      'Notifications',
      route: LRoutes.unimplemented,
    ),
    LSetting(
      'Close account',
      route: LRoutes.closeAccount,
    ),
  ];
}
