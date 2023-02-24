import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/reminder.dart';
import 'reminder_state.dart';

final reminderControllerProvider =
    StateNotifierProvider<ReminderController, ReminderState>((ref) {
  return ReminderController();
});

class ReminderController extends StateNotifier<ReminderState> {
  ReminderController() : super(const ReminderState(enable: false));

  void toggleReminder(bool value) {
    state = state.copyWith(enable: value);
  }

  void onNewReminderConfirmButtonPressed(LReminder reminder) {
    state = state.copyWith(reminders: [...state.reminders, reminder]);
  }
}
