// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LReminder _$$_LReminderFromJson(Map<String, dynamic> json) => _$_LReminder(
      id: json['id'] as String,
      time: json['time'] == null
          ? const TimeOfDay(hour: 12, minute: 0)
          : const TimeOfDayConverter()
              .fromJson(json['time'] as Map<String, Object?>),
      reminderType:
          $enumDecodeNullable(_$ReminderTypeEnumMap, json['reminderType']) ??
              ReminderType.notification,
      scheduleType:
          $enumDecodeNullable(_$ScheduleTypeEnumMap, json['scheduleType']) ??
              ScheduleType.everyday,
      selectedWeekdays: (json['selectedWeekdays'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toSet() ??
          const <int>{0},
    );

Map<String, dynamic> _$$_LReminderToJson(_$_LReminder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': const TimeOfDayConverter().toJson(instance.time),
      'reminderType': _$ReminderTypeEnumMap[instance.reminderType]!,
      'scheduleType': _$ScheduleTypeEnumMap[instance.scheduleType]!,
      'selectedWeekdays': instance.selectedWeekdays.toList(),
    };

const _$ReminderTypeEnumMap = {
  ReminderType.notification: 'notification',
  ReminderType.alarm: 'alarm',
};

const _$ScheduleTypeEnumMap = {
  ScheduleType.everyday: 'everyday',
  ScheduleType.custom: 'custom',
};
