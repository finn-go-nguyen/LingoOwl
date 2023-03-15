// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LReminder _$LReminderFromJson(Map<String, dynamic> json) {
  return _LReminder.fromJson(json);
}

/// @nodoc
mixin _$LReminder {
  @TimeOfDayConverter()
  TimeOfDay get time => throw _privateConstructorUsedError;
  ReminderType get reminderType => throw _privateConstructorUsedError;
  ScheduleType get scheduleType => throw _privateConstructorUsedError;

  /// Weekdays Sunday = 0, Monday = 1, ..., Saturday = 6
  Set<int> get selectedWeekdays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LReminderCopyWith<LReminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LReminderCopyWith<$Res> {
  factory $LReminderCopyWith(LReminder value, $Res Function(LReminder) then) =
      _$LReminderCopyWithImpl<$Res, LReminder>;
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay time,
      ReminderType reminderType,
      ScheduleType scheduleType,
      Set<int> selectedWeekdays});
}

/// @nodoc
class _$LReminderCopyWithImpl<$Res, $Val extends LReminder>
    implements $LReminderCopyWith<$Res> {
  _$LReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? reminderType = null,
    Object? scheduleType = null,
    Object? selectedWeekdays = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      reminderType: null == reminderType
          ? _value.reminderType
          : reminderType // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
      selectedWeekdays: null == selectedWeekdays
          ? _value.selectedWeekdays
          : selectedWeekdays // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LReminderCopyWith<$Res> implements $LReminderCopyWith<$Res> {
  factory _$$_LReminderCopyWith(
          _$_LReminder value, $Res Function(_$_LReminder) then) =
      __$$_LReminderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay time,
      ReminderType reminderType,
      ScheduleType scheduleType,
      Set<int> selectedWeekdays});
}

/// @nodoc
class __$$_LReminderCopyWithImpl<$Res>
    extends _$LReminderCopyWithImpl<$Res, _$_LReminder>
    implements _$$_LReminderCopyWith<$Res> {
  __$$_LReminderCopyWithImpl(
      _$_LReminder _value, $Res Function(_$_LReminder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? reminderType = null,
    Object? scheduleType = null,
    Object? selectedWeekdays = null,
  }) {
    return _then(_$_LReminder(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      reminderType: null == reminderType
          ? _value.reminderType
          : reminderType // ignore: cast_nullable_to_non_nullable
              as ReminderType,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as ScheduleType,
      selectedWeekdays: null == selectedWeekdays
          ? _value._selectedWeekdays
          : selectedWeekdays // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LReminder extends _LReminder {
  const _$_LReminder(
      {@TimeOfDayConverter() this.time = const TimeOfDay(hour: 20, minute: 0),
      this.reminderType = ReminderType.notification,
      this.scheduleType = ScheduleType.everyday,
      final Set<int> selectedWeekdays = const <int>{0}})
      : _selectedWeekdays = selectedWeekdays,
        super._();

  factory _$_LReminder.fromJson(Map<String, dynamic> json) =>
      _$$_LReminderFromJson(json);

  @override
  @JsonKey()
  @TimeOfDayConverter()
  final TimeOfDay time;
  @override
  @JsonKey()
  final ReminderType reminderType;
  @override
  @JsonKey()
  final ScheduleType scheduleType;

  /// Weekdays Sunday = 0, Monday = 1, ..., Saturday = 6
  final Set<int> _selectedWeekdays;

  /// Weekdays Sunday = 0, Monday = 1, ..., Saturday = 6
  @override
  @JsonKey()
  Set<int> get selectedWeekdays {
    if (_selectedWeekdays is EqualUnmodifiableSetView) return _selectedWeekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedWeekdays);
  }

  @override
  String toString() {
    return 'LReminder(time: $time, reminderType: $reminderType, scheduleType: $scheduleType, selectedWeekdays: $selectedWeekdays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LReminder &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.reminderType, reminderType) ||
                other.reminderType == reminderType) &&
            (identical(other.scheduleType, scheduleType) ||
                other.scheduleType == scheduleType) &&
            const DeepCollectionEquality()
                .equals(other._selectedWeekdays, _selectedWeekdays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, reminderType, scheduleType,
      const DeepCollectionEquality().hash(_selectedWeekdays));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LReminderCopyWith<_$_LReminder> get copyWith =>
      __$$_LReminderCopyWithImpl<_$_LReminder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LReminderToJson(
      this,
    );
  }
}

abstract class _LReminder extends LReminder {
  const factory _LReminder(
      {@TimeOfDayConverter() final TimeOfDay time,
      final ReminderType reminderType,
      final ScheduleType scheduleType,
      final Set<int> selectedWeekdays}) = _$_LReminder;
  const _LReminder._() : super._();

  factory _LReminder.fromJson(Map<String, dynamic> json) =
      _$_LReminder.fromJson;

  @override
  @TimeOfDayConverter()
  TimeOfDay get time;
  @override
  ReminderType get reminderType;
  @override
  ScheduleType get scheduleType;
  @override

  /// Weekdays Sunday = 0, Monday = 1, ..., Saturday = 6
  Set<int> get selectedWeekdays;
  @override
  @JsonKey(ignore: true)
  _$$_LReminderCopyWith<_$_LReminder> get copyWith =>
      throw _privateConstructorUsedError;
}
