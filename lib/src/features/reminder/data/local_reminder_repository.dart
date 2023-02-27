import 'package:online_course_app/src/features/reminder/model/reminder.dart';

abstract class LocalReminderRepository {
  Future<List<LReminder>> fetchReminders();
  Stream<List<LReminder>> watchReminders();
  Future<void> setCart(List<LReminder> reminder);
}
