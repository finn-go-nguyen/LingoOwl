import 'package:online_course_app/src/features/reminder/application/notification_service.dart';
import 'package:online_course_app/src/features/reminder/model/reminder.dart';

class ReminderService {
  ReminderService(this.notificationService);

  final NotificationService notificationService;

  void createReminder(LReminder reminder) {
    notificationService.createNotification(
      id: reminder.time.hashCode,
      title: 'Title',
      body: 'Body',
    );
  }
}
