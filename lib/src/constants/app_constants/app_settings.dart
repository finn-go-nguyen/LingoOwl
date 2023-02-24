import '../../features/settings/model/setting.dart';
import '../../router/app_router.dart';

class AppSettings {
  static const _videoPreferences = LSettingSection(
    'Video preferences',
    <LSetting>[
      LSetting(
        'Download options',
        route: LRoutes.unimplemented,
      ),
      LSetting(
        'Video playback options',
        route: LRoutes.unimplemented,
      ),
    ],
  );

  static const _accountSettings = LSettingSection(
    'Account settings',
    <LSetting>[
      LSetting(
        'Account security',
        route: LRoutes.accountSecurity,
      ),
      LSetting(
        'Learning reminders',
        route: LRoutes.reminders,
      ),
    ],
  );

  static const settingList = <LSettingSection>[
    _videoPreferences,
    _accountSettings,
  ];
}
