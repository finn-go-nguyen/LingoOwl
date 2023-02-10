// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrolled_course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnrolledCourse _$EnrolledCourseFromJson(Map<String, dynamic> json) {
  return _EnrolledCourse.fromJson(json);
}

/// @nodoc
mixin _$EnrolledCourse {
  /// Different from `CourseId`
  String get uid => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  int get timeStamp => throw _privateConstructorUsedError;
  EnrolledCourseStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnrolledCourseCopyWith<EnrolledCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrolledCourseCopyWith<$Res> {
  factory $EnrolledCourseCopyWith(
          EnrolledCourse value, $Res Function(EnrolledCourse) then) =
      _$EnrolledCourseCopyWithImpl<$Res, EnrolledCourse>;
  @useResult
  $Res call(
      {String uid,
      String courseId,
      int timeStamp,
      EnrolledCourseStatus status});
}

/// @nodoc
class _$EnrolledCourseCopyWithImpl<$Res, $Val extends EnrolledCourse>
    implements $EnrolledCourseCopyWith<$Res> {
  _$EnrolledCourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? courseId = null,
    Object? timeStamp = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnrolledCourseStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnrolledCourseCopyWith<$Res>
    implements $EnrolledCourseCopyWith<$Res> {
  factory _$$_EnrolledCourseCopyWith(
          _$_EnrolledCourse value, $Res Function(_$_EnrolledCourse) then) =
      __$$_EnrolledCourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String courseId,
      int timeStamp,
      EnrolledCourseStatus status});
}

/// @nodoc
class __$$_EnrolledCourseCopyWithImpl<$Res>
    extends _$EnrolledCourseCopyWithImpl<$Res, _$_EnrolledCourse>
    implements _$$_EnrolledCourseCopyWith<$Res> {
  __$$_EnrolledCourseCopyWithImpl(
      _$_EnrolledCourse _value, $Res Function(_$_EnrolledCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? courseId = null,
    Object? timeStamp = null,
    Object? status = null,
  }) {
    return _then(_$_EnrolledCourse(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnrolledCourseStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EnrolledCourse implements _EnrolledCourse {
  const _$_EnrolledCourse(
      {required this.uid,
      required this.courseId,
      required this.timeStamp,
      this.status = EnrolledCourseStatus.all});

  factory _$_EnrolledCourse.fromJson(Map<String, dynamic> json) =>
      _$$_EnrolledCourseFromJson(json);

  /// Different from `CourseId`
  @override
  final String uid;
  @override
  final String courseId;
  @override
  final int timeStamp;
  @override
  @JsonKey()
  final EnrolledCourseStatus status;

  @override
  String toString() {
    return 'EnrolledCourse(uid: $uid, courseId: $courseId, timeStamp: $timeStamp, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnrolledCourse &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, courseId, timeStamp, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnrolledCourseCopyWith<_$_EnrolledCourse> get copyWith =>
      __$$_EnrolledCourseCopyWithImpl<_$_EnrolledCourse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnrolledCourseToJson(
      this,
    );
  }
}

abstract class _EnrolledCourse implements EnrolledCourse {
  const factory _EnrolledCourse(
      {required final String uid,
      required final String courseId,
      required final int timeStamp,
      final EnrolledCourseStatus status}) = _$_EnrolledCourse;

  factory _EnrolledCourse.fromJson(Map<String, dynamic> json) =
      _$_EnrolledCourse.fromJson;

  @override

  /// Different from `CourseId`
  String get uid;
  @override
  String get courseId;
  @override
  int get timeStamp;
  @override
  EnrolledCourseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_EnrolledCourseCopyWith<_$_EnrolledCourse> get copyWith =>
      throw _privateConstructorUsedError;
}
