// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteScreenState {
  AsyncValue<void> get status => throw _privateConstructorUsedError;
  List<LLecture>? get lectures => throw _privateConstructorUsedError;
  List<LNote>? get notes => throw _privateConstructorUsedError;
  LCourse? get course => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteScreenStateCopyWith<NoteScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteScreenStateCopyWith<$Res> {
  factory $NoteScreenStateCopyWith(
          NoteScreenState value, $Res Function(NoteScreenState) then) =
      _$NoteScreenStateCopyWithImpl<$Res, NoteScreenState>;
  @useResult
  $Res call(
      {AsyncValue<void> status,
      List<LLecture>? lectures,
      List<LNote>? notes,
      LCourse? course});

  $LCourseCopyWith<$Res>? get course;
}

/// @nodoc
class _$NoteScreenStateCopyWithImpl<$Res, $Val extends NoteScreenState>
    implements $NoteScreenStateCopyWith<$Res> {
  _$NoteScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lectures = freezed,
    Object? notes = freezed,
    Object? course = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      lectures: freezed == lectures
          ? _value.lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<LLecture>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<LNote>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as LCourse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LCourseCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $LCourseCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NoteScreenStateCopyWith<$Res>
    implements $NoteScreenStateCopyWith<$Res> {
  factory _$$_NoteScreenStateCopyWith(
          _$_NoteScreenState value, $Res Function(_$_NoteScreenState) then) =
      __$$_NoteScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<void> status,
      List<LLecture>? lectures,
      List<LNote>? notes,
      LCourse? course});

  @override
  $LCourseCopyWith<$Res>? get course;
}

/// @nodoc
class __$$_NoteScreenStateCopyWithImpl<$Res>
    extends _$NoteScreenStateCopyWithImpl<$Res, _$_NoteScreenState>
    implements _$$_NoteScreenStateCopyWith<$Res> {
  __$$_NoteScreenStateCopyWithImpl(
      _$_NoteScreenState _value, $Res Function(_$_NoteScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lectures = freezed,
    Object? notes = freezed,
    Object? course = freezed,
  }) {
    return _then(_$_NoteScreenState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      lectures: freezed == lectures
          ? _value._lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<LLecture>?,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<LNote>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as LCourse?,
    ));
  }
}

/// @nodoc

class _$_NoteScreenState implements _NoteScreenState {
  const _$_NoteScreenState(
      {required this.status,
      final List<LLecture>? lectures,
      final List<LNote>? notes,
      this.course})
      : _lectures = lectures,
        _notes = notes;

  @override
  final AsyncValue<void> status;
  final List<LLecture>? _lectures;
  @override
  List<LLecture>? get lectures {
    final value = _lectures;
    if (value == null) return null;
    if (_lectures is EqualUnmodifiableListView) return _lectures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LNote>? _notes;
  @override
  List<LNote>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LCourse? course;

  @override
  String toString() {
    return 'NoteScreenState(status: $status, lectures: $lectures, notes: $notes, course: $course)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteScreenState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._lectures, _lectures) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.course, course) || other.course == course));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_lectures),
      const DeepCollectionEquality().hash(_notes),
      course);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteScreenStateCopyWith<_$_NoteScreenState> get copyWith =>
      __$$_NoteScreenStateCopyWithImpl<_$_NoteScreenState>(this, _$identity);
}

abstract class _NoteScreenState implements NoteScreenState {
  const factory _NoteScreenState(
      {required final AsyncValue<void> status,
      final List<LLecture>? lectures,
      final List<LNote>? notes,
      final LCourse? course}) = _$_NoteScreenState;

  @override
  AsyncValue<void> get status;
  @override
  List<LLecture>? get lectures;
  @override
  List<LNote>? get notes;
  @override
  LCourse? get course;
  @override
  @JsonKey(ignore: true)
  _$$_NoteScreenStateCopyWith<_$_NoteScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
