import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/app_router.dart';

final profileDetailsControllerProvider =
    StateNotifierProvider.autoDispose<ProfileDetailsController, LRoute>((ref) {
  return ProfileDetailsController();
});

class ProfileDetailsController extends StateNotifier<LRoute> {
  ProfileDetailsController() : super(LRoute.accountSecurity);

  void set(LRoute route) {
    if (route.isProfileDetailsSubRoute) {
      state = route;
    }
  }
}
