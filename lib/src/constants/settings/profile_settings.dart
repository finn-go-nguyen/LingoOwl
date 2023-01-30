import '../../features/settings/model/setting.dart';
import '../../router/app_router.dart';

class ProfileSettings {
  static const list = <LSetting>[
    LSetting(
      'View public profile',
      route: LRoute.unimplemented,
    ),
    LSetting(
      'Profile',
      route: LRoute.profile,
    ),
    LSetting(
      'Photo',
      route: LRoute.photo,
    ),
    LSetting(
      'Account security',
      route: LRoute.accountSecurity,
    ),
    LSetting(
      'Subscriptions',
      route: LRoute.unimplemented,
    ),
    LSetting(
      'Payment methods',
      route: LRoute.unimplemented,
    ),
    LSetting(
      'Privacy',
      route: LRoute.unimplemented,
    ),
    LSetting(
      'Notifications',
      route: LRoute.unimplemented,
    ),
    LSetting(
      'Close account',
      route: LRoute.closeAccount,
    ),
  ];
}
