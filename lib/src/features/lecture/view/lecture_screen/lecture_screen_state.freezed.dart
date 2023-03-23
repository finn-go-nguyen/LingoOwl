// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LectureScreenState {
  List<LSection> get sections => throw _privateConstructorUsedError;
  LLecture get selected => throw _privateConstructorUsedError;
  LCourseProgress get courseProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LectureScreenStateCopyWith<LectureScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureScreenStateCopyWith<$Res> {
  factory $LectureScreenStateCopyWith(
          LectureScreenState value, $Res Function(LectureScreenState) then) =
      _$LectureScreenStateCopyWithImpl<$Res, LectureScreenState>;
  @useResult
  $Res call(
      {List<LSection> sections,
      LLecture selected,
      LCourseProgress courseProgress});

  $LLectureCopyWith<$Res> get selected;
  $LCourseProgressCopyWith<$Res> get courseProgress;
}

/// @nodoc
class _$LectureScreenStateCopyWithImpl<$Res, $Val extends LectureScreenState>
    implements $LectureScreenStateCopyWith<$Res> {
  _$LectureScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
    Object? selected = null,
    Object? courseProgress = null,
  }) {
    return _then(_value.copyWith(
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<LSection>,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as LLecture,
      courseProgress: null == courseProgress
          ? _value.courseProgress
          : courseProgress // ignore: cast_nullable_to_non_nullable
              as LCourseProgress,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LLectureCopyWith<$Res> get selected {
    return $LLectureCopyWith<$Res>(_value.selected, (value) {
      return _then(_value.copyWith(selected: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LCourseProgressCopyWith<$Res> get courseProgress {
    return $LCourseProgressCopyWith<$Res>(_value.courseProgress, (value) {
      return _then(_value.copyWith(courseProgress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LectureScreenStateCopyWith<$Res>
    implements $LectureScreenStateCopyWith<$Res> {
  factory _$$_LectureScreenStateCopyWith(_$_LectureScreenState value,
          $Res Function(_$_LectureScreenState) then) =
      __$$_LectureScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LSection> sections,
      LLecture selected,
      LCourseProgress courseProgress});

  @override
  $LLectureCopyWith<$Res> get selected;
  @override
  $LCourseProgressCopyWith<$Res> get courseProgress;
}

/// @nodoc
class __$$_LectureScreenStateCopyWithImpl<$Res>
    extends _$LectureScreenStateCopyWithImpl<$Res, _$_LectureScreenState>
    implements _$$_LectureScreenStateCopyWith<$Res> {
  __$$_LectureScreenStateCopyWithImpl(
      _$_LectureScreenState _value, $Res Function(_$_LectureScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
    Object? selected = null,
    Object? courseProgress = null,
  }) {
    return _then(_$_LectureScreenState(
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<LSection>,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as LLecture,
      courseProgress: null == courseProgress
          ? _value.courseProgress
          : courseProgress // ignore: cast_nullable_to_non_nullable
              as LCourseProgress,
    ));
  }
}

/// @nodoc

class _$_LectureScreenState extends _LectureScreenState {
  const _$_LectureScreenState(
      {required final List<LSection> sections,
      required this.selected,
      required this.courseProgress})
      : _sections = sections,
        super._();

  final List<LSection> _sections;
  @override
  List<LSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  final LLecture selected;
  @override
  final LCourseProgress courseProgress;

  @override
  String toString() {
    return 'LectureScreenState(sections: $sections, selected: $selected, courseProgress: $courseProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LectureScreenState &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.courseProgress, courseProgress) ||
                other.courseProgress == courseProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_sections), selected, courseProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LectureScreenStateCopyWith<_$_LectureScreenState> get copyWith =>
      __$$_LectureScreenStateCopyWithImpl<_$_LectureScreenState>(
          this, _$identity);
}

abstract class _LectureScreenState extends LectureScreenState {
  const factory _LectureScreenState(
      {required final List<LSection> sections,
      required final LLecture selected,
      required final LCourseProgress courseProgress}) = _$_LectureScreenState;
  const _LectureScreenState._() : super._();

  @override
  List<LSection> get sections;
  @override
  LLecture get selected;
  @override
  LCourseProgress get courseProgress;
  @override
  @JsonKey(ignore: true)
  _$$_LectureScreenStateCopyWith<_$_LectureScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
