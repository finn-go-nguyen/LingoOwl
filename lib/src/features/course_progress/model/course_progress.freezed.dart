// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LCourseProgress _$LCourseProgressFromJson(Map<String, dynamic> json) {
  return _LCourseProgress.fromJson(json);
}

/// @nodoc
mixin _$LCourseProgress {
  String get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  /// Map<LectureIndex, IsLectureWatched>
  List<int> get watchedLectures => throw _privateConstructorUsedError;
  int? get lastWatchLecture => throw _privateConstructorUsedError;
  int get videoPosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LCourseProgressCopyWith<LCourseProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LCourseProgressCopyWith<$Res> {
  factory $LCourseProgressCopyWith(
          LCourseProgress value, $Res Function(LCourseProgress) then) =
      _$LCourseProgressCopyWithImpl<$Res, LCourseProgress>;
  @useResult
  $Res call(
      {String id,
      String courseId,
      String userId,
      List<int> watchedLectures,
      int? lastWatchLecture,
      int videoPosition});
}

/// @nodoc
class _$LCourseProgressCopyWithImpl<$Res, $Val extends LCourseProgress>
    implements $LCourseProgressCopyWith<$Res> {
  _$LCourseProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? userId = null,
    Object? watchedLectures = null,
    Object? lastWatchLecture = freezed,
    Object? videoPosition = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      watchedLectures: null == watchedLectures
          ? _value.watchedLectures
          : watchedLectures // ignore: cast_nullable_to_non_nullable
              as List<int>,
      lastWatchLecture: freezed == lastWatchLecture
          ? _value.lastWatchLecture
          : lastWatchLecture // ignore: cast_nullable_to_non_nullable
              as int?,
      videoPosition: null == videoPosition
          ? _value.videoPosition
          : videoPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LCourseProgressCopyWith<$Res>
    implements $LCourseProgressCopyWith<$Res> {
  factory _$$_LCourseProgressCopyWith(
          _$_LCourseProgress value, $Res Function(_$_LCourseProgress) then) =
      __$$_LCourseProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String courseId,
      String userId,
      List<int> watchedLectures,
      int? lastWatchLecture,
      int videoPosition});
}

/// @nodoc
class __$$_LCourseProgressCopyWithImpl<$Res>
    extends _$LCourseProgressCopyWithImpl<$Res, _$_LCourseProgress>
    implements _$$_LCourseProgressCopyWith<$Res> {
  __$$_LCourseProgressCopyWithImpl(
      _$_LCourseProgress _value, $Res Function(_$_LCourseProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? userId = null,
    Object? watchedLectures = null,
    Object? lastWatchLecture = freezed,
    Object? videoPosition = null,
  }) {
    return _then(_$_LCourseProgress(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      watchedLectures: null == watchedLectures
          ? _value._watchedLectures
          : watchedLectures // ignore: cast_nullable_to_non_nullable
              as List<int>,
      lastWatchLecture: freezed == lastWatchLecture
          ? _value.lastWatchLecture
          : lastWatchLecture // ignore: cast_nullable_to_non_nullable
              as int?,
      videoPosition: null == videoPosition
          ? _value.videoPosition
          : videoPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LCourseProgress extends _LCourseProgress {
  const _$_LCourseProgress(
      {required this.id,
      required this.courseId,
      required this.userId,
      final List<int> watchedLectures = const <Index>[],
      this.lastWatchLecture,
      this.videoPosition = 0})
      : _watchedLectures = watchedLectures,
        super._();

  factory _$_LCourseProgress.fromJson(Map<String, dynamic> json) =>
      _$$_LCourseProgressFromJson(json);

  @override
  final String id;
  @override
  final String courseId;
  @override
  final String userId;

  /// Map<LectureIndex, IsLectureWatched>
  final List<int> _watchedLectures;

  /// Map<LectureIndex, IsLectureWatched>
  @override
  @JsonKey()
  List<int> get watchedLectures {
    if (_watchedLectures is EqualUnmodifiableListView) return _watchedLectures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_watchedLectures);
  }

  @override
  final int? lastWatchLecture;
  @override
  @JsonKey()
  final int videoPosition;

  @override
  String toString() {
    return 'LCourseProgress(id: $id, courseId: $courseId, userId: $userId, watchedLectures: $watchedLectures, lastWatchLecture: $lastWatchLecture, videoPosition: $videoPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LCourseProgress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._watchedLectures, _watchedLectures) &&
            (identical(other.lastWatchLecture, lastWatchLecture) ||
                other.lastWatchLecture == lastWatchLecture) &&
            (identical(other.videoPosition, videoPosition) ||
                other.videoPosition == videoPosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      courseId,
      userId,
      const DeepCollectionEquality().hash(_watchedLectures),
      lastWatchLecture,
      videoPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LCourseProgressCopyWith<_$_LCourseProgress> get copyWith =>
      __$$_LCourseProgressCopyWithImpl<_$_LCourseProgress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LCourseProgressToJson(
      this,
    );
  }
}

abstract class _LCourseProgress extends LCourseProgress {
  const factory _LCourseProgress(
      {required final String id,
      required final String courseId,
      required final String userId,
      final List<int> watchedLectures,
      final int? lastWatchLecture,
      final int videoPosition}) = _$_LCourseProgress;
  const _LCourseProgress._() : super._();

  factory _LCourseProgress.fromJson(Map<String, dynamic> json) =
      _$_LCourseProgress.fromJson;

  @override
  String get id;
  @override
  String get courseId;
  @override
  String get userId;
  @override

  /// Map<LectureIndex, IsLectureWatched>
  List<int> get watchedLectures;
  @override
  int? get lastWatchLecture;
  @override
  int get videoPosition;
  @override
  @JsonKey(ignore: true)
  _$$_LCourseProgressCopyWith<_$_LCourseProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
