// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LLectureWrapper _$LLectureWrapperFromJson(Map<String, dynamic> json) {
  return _LLectureWrapper.fromJson(json);
}

/// @nodoc
mixin _$LLectureWrapper {
  String get courseId => throw _privateConstructorUsedError;
  List<LLecture> get lectures => throw _privateConstructorUsedError;
  List<LSection> get sections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LLectureWrapperCopyWith<LLectureWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LLectureWrapperCopyWith<$Res> {
  factory $LLectureWrapperCopyWith(
          LLectureWrapper value, $Res Function(LLectureWrapper) then) =
      _$LLectureWrapperCopyWithImpl<$Res, LLectureWrapper>;
  @useResult
  $Res call(
      {String courseId, List<LLecture> lectures, List<LSection> sections});
}

/// @nodoc
class _$LLectureWrapperCopyWithImpl<$Res, $Val extends LLectureWrapper>
    implements $LLectureWrapperCopyWith<$Res> {
  _$LLectureWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? lectures = null,
    Object? sections = null,
  }) {
    return _then(_value.copyWith(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      lectures: null == lectures
          ? _value.lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<LLecture>,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<LSection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LLectureWrapperCopyWith<$Res>
    implements $LLectureWrapperCopyWith<$Res> {
  factory _$$_LLectureWrapperCopyWith(
          _$_LLectureWrapper value, $Res Function(_$_LLectureWrapper) then) =
      __$$_LLectureWrapperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String courseId, List<LLecture> lectures, List<LSection> sections});
}

/// @nodoc
class __$$_LLectureWrapperCopyWithImpl<$Res>
    extends _$LLectureWrapperCopyWithImpl<$Res, _$_LLectureWrapper>
    implements _$$_LLectureWrapperCopyWith<$Res> {
  __$$_LLectureWrapperCopyWithImpl(
      _$_LLectureWrapper _value, $Res Function(_$_LLectureWrapper) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? lectures = null,
    Object? sections = null,
  }) {
    return _then(_$_LLectureWrapper(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      lectures: null == lectures
          ? _value._lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as List<LLecture>,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<LSection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LLectureWrapper implements _LLectureWrapper {
  const _$_LLectureWrapper(
      {required this.courseId,
      required final List<LLecture> lectures,
      required final List<LSection> sections})
      : _lectures = lectures,
        _sections = sections;

  factory _$_LLectureWrapper.fromJson(Map<String, dynamic> json) =>
      _$$_LLectureWrapperFromJson(json);

  @override
  final String courseId;
  final List<LLecture> _lectures;
  @override
  List<LLecture> get lectures {
    if (_lectures is EqualUnmodifiableListView) return _lectures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lectures);
  }

  final List<LSection> _sections;
  @override
  List<LSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'LLectureWrapper(courseId: $courseId, lectures: $lectures, sections: $sections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LLectureWrapper &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            const DeepCollectionEquality().equals(other._lectures, _lectures) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      courseId,
      const DeepCollectionEquality().hash(_lectures),
      const DeepCollectionEquality().hash(_sections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LLectureWrapperCopyWith<_$_LLectureWrapper> get copyWith =>
      __$$_LLectureWrapperCopyWithImpl<_$_LLectureWrapper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LLectureWrapperToJson(
      this,
    );
  }
}

abstract class _LLectureWrapper implements LLectureWrapper {
  const factory _LLectureWrapper(
      {required final String courseId,
      required final List<LLecture> lectures,
      required final List<LSection> sections}) = _$_LLectureWrapper;

  factory _LLectureWrapper.fromJson(Map<String, dynamic> json) =
      _$_LLectureWrapper.fromJson;

  @override
  String get courseId;
  @override
  List<LLecture> get lectures;
  @override
  List<LSection> get sections;
  @override
  @JsonKey(ignore: true)
  _$$_LLectureWrapperCopyWith<_$_LLectureWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}
