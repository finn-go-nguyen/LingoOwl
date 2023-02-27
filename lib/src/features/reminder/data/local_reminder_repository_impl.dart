import 'package:online_course_app/src/features/reminder/model/reminder.dart';

import 'local_reminder_repository.dart';
import 'local_reminder_collection_reference.dart';

class LocalReminderRepositoryImpl implements LocalReminderRepository {
  final ref = LocalReminderCollectionReference();

  Future<void> init() => ref.init();

  // call this when the DB is no longer needed
  void dispose() => ref.dispose();

  @override
  Future<List<LReminder>> fetchReminders() {
    // TODO: implement fetchReminders
    throw UnimplementedError();
  }

  @override
  Future<void> setCart(List<LReminder> reminder) {
    // TODO: implement setCart
    throw UnimplementedError();
  }

  @override
  Stream<List<LReminder>> watchReminders() {
    // TODO: implement watchReminders
    throw UnimplementedError();
  }
}
