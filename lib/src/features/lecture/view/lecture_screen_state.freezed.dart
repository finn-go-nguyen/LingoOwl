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
  List<LLecture> get lectures => throw _privateConstructorUsedError;
  LLecture get selected => throw _privateConstructorUsedError;

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
      {List<LSection> sections, List<LLecture> lectures, LLecture selected});

  $LLectureCopyWith<$Res> get selected;
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
    Object? lectures = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<LSection>,
      lectures: null == lectures
          ? _value.lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<LLecture>,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as LLecture,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LLectureCopyWith<$Res> get selected {
    return $LLectureCopyWith<$Res>(_value.selected, (value) {
      return _then(_value.copyWith(selected: value) as $Val);
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
      {List<LSection> sections, List<LLecture> lectures, LLecture selected});

  @override
  $LLectureCopyWith<$Res> get selected;
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
    Object? lectures = null,
    Object? selected = null,
  }) {
    return _then(_$_LectureScreenState(
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<LSection>,
      lectures: null == lectures
          ? _value._lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<LLecture>,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as LLecture,
    ));
  }
}

/// @nodoc

class _$_LectureScreenState implements _LectureScreenState {
  const _$_LectureScreenState(
      {required final List<LSection> sections,
      required final List<LLecture> lectures,
      required this.selected})
      : _sections = sections,
        _lectures = lectures;

  final List<LSection> _sections;
  @override
  List<LSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  final List<LLecture> _lectures;
  @override
  List<LLecture> get lectures {
    if (_lectures is EqualUnmodifiableListView) return _lectures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lectures);
  }

  @override
  final LLecture selected;

  @override
  String toString() {
    return 'LectureScreenState(sections: $sections, lectures: $lectures, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LectureScreenState &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            const DeepCollectionEquality().equals(other._lectures, _lectures) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sections),
      const DeepCollectionEquality().hash(_lectures),
      selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LectureScreenStateCopyWith<_$_LectureScreenState> get copyWith =>
      __$$_LectureScreenStateCopyWithImpl<_$_LectureScreenState>(
          this, _$identity);
}

abstract class _LectureScreenState implements LectureScreenState {
  const factory _LectureScreenState(
      {required final List<LSection> sections,
      required final List<LLecture> lectures,
      required final LLecture selected}) = _$_LectureScreenState;

  @override
  List<LSection> get sections;
  @override
  List<LLecture> get lectures;
  @override
  LLecture get selected;
  @override
  @JsonKey(ignore: true)
  _$$_LectureScreenStateCopyWith<_$_LectureScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
