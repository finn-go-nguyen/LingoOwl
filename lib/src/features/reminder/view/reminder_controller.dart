import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../application/reminder_service.dart';
import '../model/reminder.dart';

final reminderControllerProvider =
    StateNotifierProvider<ReminderController, AsyncValue<void>>((ref) {
  final reminderService = ref.watch(reminderServiceProvider);
  return ReminderController(reminderService);
});

class ReminderController extends StateNotifier<AsyncValue<void>> {
  ReminderController(
    this.reminderService,
  ) : super(const AsyncData(null));

  final ReminderService reminderService;

  void onNewReminderConfirmButtonPressed(LReminder reminder,
      {bool isUpdate = false, ReminderId? oldId}) async {
    if (isUpdate) {
      assert(oldId != null);
      state = await AsyncValue.guard(
          () => reminderService.updateReminder(oldId!, reminder));
      return;
    }
    state =
        await AsyncValue.guard(() => reminderService.createReminder(reminder));
  }

  void onDeleteButtonPressed(LReminder reminder) async {
    state =
        await AsyncValue.guard(() => reminderService.deleteReminder(reminder));
  }
}
