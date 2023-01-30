import '../../../router/app_router.dart';

class LSetting {
  const LSetting(
    this.name, {
    required this.route,
  });
  final String name;
  final LRoutes route;
}

class LSettingSection {
  const LSettingSection(this.sectionName, this.options);

  final String sectionName;
  final List<LSetting> options;
}
