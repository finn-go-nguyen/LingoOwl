import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converter.dart';
import 'reminder_type.dart';
import 'schedule_type.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@freezed
class LReminder with _$LReminder {
  const LReminder._();
  const factory LReminder({
    @TimeOfDayConverter()
    @Default(TimeOfDay(hour: 20, minute: 0))
        TimeOfDay time,
    @Default(ReminderType.notification) ReminderType reminderType,
    @Default(ScheduleType.everyday) ScheduleType scheduleType,

    /// Weekdays Sunday = 0, Monday = 1, ..., Saturday = 6
    @Default(<int>{0}) Set<int> selectedWeekdays,
  }) = _LReminder;

  factory LReminder.fromJson(Map<String, Object?> json) =>
      _$LReminderFromJson(json);

  int get id => time.hashCode;

  List<int> get dateTimeWeekdays {
    final result = List<int>.from(selectedWeekdays);
    if (result.contains(0)) {
      result
        ..remove(0)
        ..add(DateTime.sunday);
    }
    return result;
  }
}
