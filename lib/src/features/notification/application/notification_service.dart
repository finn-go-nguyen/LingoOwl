import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../themes/colors.dart';
import '../data/notification_channels.dart';
import '../notification_controller.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final notification = AwesomeNotifications();
  ref.onDispose(notification.dispose);
  return NotificationService(notification);
});

class NotificationService {
  NotificationService(this.notification);

  final AwesomeNotifications notification;

  Future<void> initialize() async {
    notification.initialize(
      null,
      _channels,
      channelGroups: _channelsGroup,
      debug: true,
    );
    _setListeners();
  }

  late final _channelsGroup = <NotificationChannelGroup>[
    NotificationChannelGroup(
      channelGroupKey: ChannelGroupKeys.reminder.name,
      channelGroupName: ChannelGroupKeys.reminder.channelName,
    ),
  ];
  late final _channels = <NotificationChannel>[
    NotificationChannel(
      channelGroupKey: ChannelGroupKeys.reminder.name,
      channelKey: ChannelKeys.notificationReminder.name,
      channelName: ChannelKeys.notificationReminder.channelName,
      channelDescription: 'Reminders to help you meet your goals faster',
      ledColor: LColors.primary,
      importance: NotificationImportance.Max,
      channelShowBadge: true,
      playSound: true,
      defaultRingtoneType: DefaultRingtoneType.Notification,
    ),
    NotificationChannel(
      channelGroupKey: ChannelGroupKeys.reminder.name,
      channelKey: ChannelKeys.alarmReminder.name,
      channelName: ChannelKeys.alarmReminder.channelName,
      channelDescription: 'Reminders to help you meet your goals faster',
      ledColor: LColors.primary,
      importance: NotificationImportance.Max,
      channelShowBadge: true,
      playSound: true,
      defaultRingtoneType: DefaultRingtoneType.Alarm,
    ),
  ];

  void _setListeners() {
    notification.setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  Future<void> requestPermission() async {
    final isAllowed = await notification.isNotificationAllowed();
    if (isAllowed) return;

    await notification.requestPermissionToSendNotifications();
  }

  void createNotification({
    required String channelKey,
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    int? weekday,
    NotificationCategory? category,
    bool repeats = false,
  }) async {
    await requestPermission();
    notification.createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: body,
        category: category,
        wakeUpScreen: true,
        fullScreenIntent: true,
        autoDismissible: false,
      ),
      schedule: NotificationCalendar(
        weekday: weekday,
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: repeats,
      ),
    );
  }

  void createMultipleNotification({
    required String channelKey,
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    NotificationCategory? category,
    bool repeats = false,
    required List<int> weekdays,
  }) async {
    await requestPermission();

    for (var weekday in weekdays) {
      final content = NotificationContent(
        id: _idGenerator(id, weekday),
        channelKey: channelKey,
        title: title,
        body: body,
        category: category,
        wakeUpScreen: true,
        fullScreenIntent: true,
        autoDismissible: false,
      );

      final schedule = NotificationCalendar(
        weekday: weekday,
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: repeats,
      );

      notification.createNotification(content: content, schedule: schedule);
    }
  }

  void cancelNotification(int id) {
    notification.cancel(id);
  }

  void cancelNotifications(int id, List<int> weekdays) {
    for (var weekday in weekdays) {
      notification.cancel(_idGenerator(id, weekday));
    }
  }

  void cancelNotificationsByGroupKey(String groupKey) {
    notification.cancelNotificationsByGroupKey(groupKey);
  }

  int _idGenerator(int reminderId, int weekday) => reminderId + weekday;
}
