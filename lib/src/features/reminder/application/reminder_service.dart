import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../notification/data/notification_channels.dart';
import '../../notification/notification_service.dart';
import '../data/reminder_repository.dart';
import '../model/reminder.dart';

final reminderServiceProvider = Provider<ReminderService>((ref) {
  final notificationService = ref.watch(notificationServiceProvider);
  final reminderRepository =
      ref.watch(DomainManager.instance.reminderRepositoryProvider);
  return ReminderService(
    notificationService,
    reminderRepository,
  );
});

class ReminderService {
  ReminderService(
    this.notificationService,
    this.reminderRepository,
  );

  final NotificationService notificationService;
  final ReminderRepository reminderRepository;

  Future<void> createReminder(LReminder reminder) async {
    try {
      final reminders = await reminderRepository.fetchReminders();
      if (_isExist(reminders, reminder)) return;

      reminderRepository.setReminders([...reminders, reminder]);

      _createReminder(reminder);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteReminder(LReminder reminder) async {
    try {
      final reminderId = reminder.id;
      final reminders = await reminderRepository.fetchReminders();

      final update = List<LReminder>.from(reminders)
        ..removeWhere(
          (element) => element.id == reminderId,
        );
      reminderRepository.setReminders(update);

      if (reminder.scheduleType.isEveryday) {
        notificationService.cancelNotification(reminderId);
      }

      if (reminder.scheduleType.isCustom) {
        notificationService.cancelNotifications(
          reminderId,
          reminder.dateTimeWeekdays,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateReminder(ReminderId oldId, LReminder reminder) async {
    try {
      final weekdays = [
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
        DateTime.friday,
        DateTime.saturday,
        DateTime.sunday,
      ];

      notificationService.cancelNotifications(
        reminder.id,
        weekdays,
      );

      final reminders = await reminderRepository.fetchReminders();
      final update =
          reminders.map((e) => e.id == oldId ? reminder : e).toList();
      reminderRepository.setReminders(update);

      _createReminder(reminder);
    } catch (e) {
      rethrow;
    }
  }

  bool _isExist(List<LReminder> list, LReminder item) {
    try {
      list.firstWhere((element) => element.time == item.time);
      return true;
    } on StateError {
      return false;
    }
  }

  void _createReminder(LReminder reminder) {
    const title = 'Time to learn';
    const body =
        'Stay on track to meet your goals by learning a little every day. '
        'Let\'s get started';
    if (reminder.scheduleType.isEveryday) {
      notificationService.createNotification(
        repeats: true,
        channelKey: reminder.reminderType.isAlarm
            ? ChannelKeys.alarmReminder.name
            : ChannelKeys.notificationReminder.name,
        id: reminder.id,
        title: title,
        body: body,
        hour: reminder.time.hour,
        minute: reminder.time.minute,
        category: reminder.reminderType.isAlarm
            ? NotificationCategory.Alarm
            : NotificationCategory.Reminder,
      );
    }

    if (reminder.scheduleType.isCustom) {
      notificationService.createMultipleNotification(
        repeats: true,
        channelKey: reminder.reminderType.isAlarm
            ? ChannelKeys.alarmReminder.name
            : ChannelKeys.notificationReminder.name,
        id: reminder.id,
        title: title,
        body: body,
        hour: reminder.time.hour,
        minute: reminder.time.minute,
        weekdays: reminder.dateTimeWeekdays,
        category: reminder.reminderType.isAlarm
            ? NotificationCategory.Alarm
            : NotificationCategory.Reminder,
      );
    }
  }
}
