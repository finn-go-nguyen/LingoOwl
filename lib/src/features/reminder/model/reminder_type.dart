import 'package:flutter/material.dart';

enum ReminderType {
  notification(Icons.notifications_outlined),
  alarm(Icons.alarm_outlined);

  const ReminderType(this.iconData);

  final IconData iconData;

  bool get isNotification => this == ReminderType.notification;
  bool get isAlarm => this == ReminderType.alarm;
}
