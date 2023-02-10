// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LReview _$LReviewFromJson(Map<String, dynamic> json) {
  return _LReview.fromJson(json);
}

/// @nodoc
mixin _$LReview {
  String get reviewId => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get reviewerName => throw _privateConstructorUsedError;
  int get star => throw _privateConstructorUsedError;
  int get timeStamp => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LReviewCopyWith<LReview> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LReviewCopyWith<$Res> {
  factory $LReviewCopyWith(LReview value, $Res Function(LReview) then) =
      _$LReviewCopyWithImpl<$Res, LReview>;
  @useResult
  $Res call(
      {String reviewId,
      String courseId,
      String reviewerName,
      int star,
      int timeStamp,
      String content});
}

/// @nodoc
class _$LReviewCopyWithImpl<$Res, $Val extends LReview>
    implements $LReviewCopyWith<$Res> {
  _$LReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? courseId = null,
    Object? reviewerName = null,
    Object? star = null,
    Object? timeStamp = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LReviewCopyWith<$Res> implements $LReviewCopyWith<$Res> {
  factory _$$_LReviewCopyWith(
          _$_LReview value, $Res Function(_$_LReview) then) =
      __$$_LReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reviewId,
      String courseId,
      String reviewerName,
      int star,
      int timeStamp,
      String content});
}

/// @nodoc
class __$$_LReviewCopyWithImpl<$Res>
    extends _$LReviewCopyWithImpl<$Res, _$_LReview>
    implements _$$_LReviewCopyWith<$Res> {
  __$$_LReviewCopyWithImpl(_$_LReview _value, $Res Function(_$_LReview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? courseId = null,
    Object? reviewerName = null,
    Object? star = null,
    Object? timeStamp = null,
    Object? content = null,
  }) {
    return _then(_$_LReview(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LReview extends _LReview {
  const _$_LReview(
      {required this.reviewId,
      required this.courseId,
      required this.reviewerName,
      required this.star,
      required this.timeStamp,
      required this.content})
      : super._();

  factory _$_LReview.fromJson(Map<String, dynamic> json) =>
      _$$_LReviewFromJson(json);

  @override
  final String reviewId;
  @override
  final String courseId;
  @override
  final String reviewerName;
  @override
  final int star;
  @override
  final int timeStamp;
  @override
  final String content;

  @override
  String toString() {
    return 'LReview(reviewId: $reviewId, courseId: $courseId, reviewerName: $reviewerName, star: $star, timeStamp: $timeStamp, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LReview &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, reviewId, courseId, reviewerName, star, timeStamp, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LReviewCopyWith<_$_LReview> get copyWith =>
      __$$_LReviewCopyWithImpl<_$_LReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LReviewToJson(
      this,
    );
  }
}

abstract class _LReview extends LReview {
  const factory _LReview(
      {required final String reviewId,
      required final String courseId,
      required final String reviewerName,
      required final int star,
      required final int timeStamp,
      required final String content}) = _$_LReview;
  const _LReview._() : super._();

  factory _LReview.fromJson(Map<String, dynamic> json) = _$_LReview.fromJson;

  @override
  String get reviewId;
  @override
  String get courseId;
  @override
  String get reviewerName;
  @override
  int get star;
  @override
  int get timeStamp;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_LReviewCopyWith<_$_LReview> get copyWith =>
      throw _privateConstructorUsedError;
}
