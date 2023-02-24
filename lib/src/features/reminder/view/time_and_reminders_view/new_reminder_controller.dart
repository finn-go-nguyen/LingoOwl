import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../model/reminder.dart';
import '../../model/reminder_type.dart';
import '../../model/schedule_type.dart';

final newReminderControllerProvider = StateNotifierProvider.autoDispose
    .family<NewReminderController, LReminder, LReminder?>((ref, reminder) {
  return NewReminderController(reminder);
});

class NewReminderController extends StateNotifier<LReminder> {
  NewReminderController(LReminder? reminder)
      : super(reminder ?? LReminder(id: const Uuid().v1()));

  void onReminderTimeChanged(Future<TimeOfDay?> Function() timePicker) async {
    final result = await timePicker();

    if (result == null) return;

    state = state.copyWith(time: result);
  }

  void onReminderTypeChanged(ReminderType type) {
    state = state.copyWith(reminderType: type);
  }

  void onScheduleTypeChanged(ScheduleType type) {
    state = state.copyWith(scheduleType: type);
  }

  void onWeekdaysChanged(SelectedWeekdays weekdays) {
    if (weekdays.length == DateTime.daysPerWeek) {
      state = state.copyWith(scheduleType: ScheduleType.everyday);
      return;
    }
    state = state.copyWith(selectedWeekdays: weekdays);
  }
}
