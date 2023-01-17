import '../../features/settings/model/setting.dart';
import '../../router/app_router.dart';

class AppSettings {
  static const _videoPreferences = LSettingSection(
    'Video preferences',
    <LSetting>[
      LSetting(
        'Download options',
        route: LRoute.unimplemented,
      ),
      LSetting(
        'Video playback options',
        route: LRoute.unimplemented,
      ),
    ],
  );

  static const _accountSettings = LSettingSection(
    'Account settings',
    <LSetting>[
      LSetting(
        'Account security',
        route: LRoute.accountSecurity,
      ),
      LSetting(
        'Learning reminders',
        route: LRoute.unimplemented,
      ),
    ],
  );

  static const settingList = <LSettingSection>[
    _videoPreferences,
    _accountSettings,
  ];
}
