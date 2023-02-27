enum ChannelGroupKeys {
  reminder(channelName: 'Learning reminders');

  final String channelName;

  const ChannelGroupKeys({required this.channelName});
}

enum ChannelKeys {
  notificationReminder(channelName: 'Notification reminder'),
  alarmReminder(channelName: 'Alarm reminder');

  final String channelName;

  const ChannelKeys({required this.channelName});
}
