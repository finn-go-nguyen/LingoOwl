import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

typedef TimeOfDayMap = Map<String, Object?>;

class TimeOfDayConverter implements JsonConverter<TimeOfDay, TimeOfDayMap> {
  const TimeOfDayConverter();
  @override
  TimeOfDay fromJson(TimeOfDayMap timeMap) {
    return TimeOfDay(
      hour: (timeMap['hour'] as num).toInt(),
      minute: (timeMap['minute'] as num).toInt(),
    );
  }

  @override
  TimeOfDayMap toJson(TimeOfDay time) => TimeOfDayMap.of({
        'hour': time.hour,
        'minute': time.minute,
      });
}
