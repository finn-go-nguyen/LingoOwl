import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_course_app/src/themes/colors.dart';

import 'notification_controller.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final notification = AwesomeNotifications();
  return NotificationService(notification,
      channelKey: 'key', channelName: 'Name');
});

class NotificationService {
  NotificationService(
    this.notification, {
    required this.channelKey,
    required this.channelName,
  });

  final AwesomeNotifications notification;
  final String channelKey;
  final String channelName;

  Future<void> initialize() async {
    notification.initialize(
      null,
      _channels,
      debug: true,
    );
    _setListeners();
  }

  late final _channels = <NotificationChannel>[
    NotificationChannel(
      channelKey: channelKey,
      channelName: channelName,
      channelDescription: 'Reminders to help you meet your goals faster',
      defaultColor: LColors.primary,
      ledColor: Colors.white,
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

  void requestPermission({void Function()? onRequested}) {
    notification.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        notification.requestPermissionToSendNotifications();
        onRequested?.call();
      }
    });
  }

  void createNotification({
    required int id,
    required String title,
    required String body,
  }) {
    requestPermission();
    notification.createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: DateTime.now().toIso8601String(),
        actionType: ActionType.SilentBackgroundAction,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        second: 10,
        repeats: true,
        preciseAlarm: true,
        allowWhileIdle: true,
      ),
    );
  }
}
