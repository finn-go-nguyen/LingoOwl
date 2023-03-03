import '../model/reminder.dart';

abstract class ReminderRepository {
  Future<List<LReminder>> fetchReminders();
  Stream<List<LReminder>> watchReminders();
  Future<void> setReminders(List<LReminder> reminders);
}
