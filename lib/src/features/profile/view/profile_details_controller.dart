import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/app_router.dart';

final profileDetailsControllerProvider =
    StateNotifierProvider.autoDispose<ProfileDetailsController, LRoutes>((ref) {
  return ProfileDetailsController();
});

class ProfileDetailsController extends StateNotifier<LRoutes> {
  ProfileDetailsController() : super(LRoutes.accountSecurity);

  void set(LRoutes route) {
    if (route.isProfileDetailsSubRoute) {
      state = route;
    }
  }
}
