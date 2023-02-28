import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';
import 'reminder_type.dart';
import 'schedule_type.dart';

part 'reminder.freezed.dart';

@freezed
class LReminder with _$LReminder {
  const factory LReminder({
    required ReminderId id,
    @Default(TimeOfDay(hour: 12, minute: 0)) TimeOfDay time,
    @Default(ReminderType.notification) ReminderType reminderType,
    @Default(ScheduleType.everyday) ScheduleType scheduleType,

    /// Weekdays Sunday = 0, Monday = 1, ..., Saturday = 6
    @Default(<int>{0}) Set<int> selectedWeekdays,
  }) = _LReminder;
}
