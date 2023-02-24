import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/reminder.dart';

part 'reminder_state.freezed.dart';

@freezed
class ReminderState with _$ReminderState {
  const factory ReminderState({
    required bool enable,
    @Default(<LReminder>[]) List<LReminder> reminders,
  }) = _ReminderState;
}
