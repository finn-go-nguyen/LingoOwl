// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReminderState {
  bool get enable => throw _privateConstructorUsedError;
  List<LReminder> get reminders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderStateCopyWith<ReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderStateCopyWith<$Res> {
  factory $ReminderStateCopyWith(
          ReminderState value, $Res Function(ReminderState) then) =
      _$ReminderStateCopyWithImpl<$Res, ReminderState>;
  @useResult
  $Res call({bool enable, List<LReminder> reminders});
}

/// @nodoc
class _$ReminderStateCopyWithImpl<$Res, $Val extends ReminderState>
    implements $ReminderStateCopyWith<$Res> {
  _$ReminderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? reminders = null,
  }) {
    return _then(_value.copyWith(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      reminders: null == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<LReminder>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReminderStateCopyWith<$Res>
    implements $ReminderStateCopyWith<$Res> {
  factory _$$_ReminderStateCopyWith(
          _$_ReminderState value, $Res Function(_$_ReminderState) then) =
      __$$_ReminderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enable, List<LReminder> reminders});
}

/// @nodoc
class __$$_ReminderStateCopyWithImpl<$Res>
    extends _$ReminderStateCopyWithImpl<$Res, _$_ReminderState>
    implements _$$_ReminderStateCopyWith<$Res> {
  __$$_ReminderStateCopyWithImpl(
      _$_ReminderState _value, $Res Function(_$_ReminderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? reminders = null,
  }) {
    return _then(_$_ReminderState(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      reminders: null == reminders
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<LReminder>,
    ));
  }
}

/// @nodoc

class _$_ReminderState implements _ReminderState {
  const _$_ReminderState(
      {required this.enable,
      final List<LReminder> reminders = const <LReminder>[]})
      : _reminders = reminders;

  @override
  final bool enable;
  final List<LReminder> _reminders;
  @override
  @JsonKey()
  List<LReminder> get reminders {
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  String toString() {
    return 'ReminderState(enable: $enable, reminders: $reminders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReminderState &&
            (identical(other.enable, enable) || other.enable == enable) &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, enable, const DeepCollectionEquality().hash(_reminders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReminderStateCopyWith<_$_ReminderState> get copyWith =>
      __$$_ReminderStateCopyWithImpl<_$_ReminderState>(this, _$identity);
}

abstract class _ReminderState implements ReminderState {
  const factory _ReminderState(
      {required final bool enable,
      final List<LReminder> reminders}) = _$_ReminderState;

  @override
  bool get enable;
  @override
  List<LReminder> get reminders;
  @override
  @JsonKey(ignore: true)
  _$$_ReminderStateCopyWith<_$_ReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}
