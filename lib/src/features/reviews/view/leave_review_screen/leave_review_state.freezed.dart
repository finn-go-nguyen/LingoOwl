// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaveReviewState {
  int get rating => throw _privateConstructorUsedError;
  AsyncValue<void> get status => throw _privateConstructorUsedError;
  String? get reviewId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaveReviewStateCopyWith<LeaveReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveReviewStateCopyWith<$Res> {
  factory $LeaveReviewStateCopyWith(
          LeaveReviewState value, $Res Function(LeaveReviewState) then) =
      _$LeaveReviewStateCopyWithImpl<$Res, LeaveReviewState>;
  @useResult
  $Res call({int rating, AsyncValue<void> status, String? reviewId});
}

/// @nodoc
class _$LeaveReviewStateCopyWithImpl<$Res, $Val extends LeaveReviewState>
    implements $LeaveReviewStateCopyWith<$Res> {
  _$LeaveReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? status = null,
    Object? reviewId = freezed,
  }) {
    return _then(_value.copyWith(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LeaveReviewStateCopyWith<$Res>
    implements $LeaveReviewStateCopyWith<$Res> {
  factory _$$_LeaveReviewStateCopyWith(
          _$_LeaveReviewState value, $Res Function(_$_LeaveReviewState) then) =
      __$$_LeaveReviewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rating, AsyncValue<void> status, String? reviewId});
}

/// @nodoc
class __$$_LeaveReviewStateCopyWithImpl<$Res>
    extends _$LeaveReviewStateCopyWithImpl<$Res, _$_LeaveReviewState>
    implements _$$_LeaveReviewStateCopyWith<$Res> {
  __$$_LeaveReviewStateCopyWithImpl(
      _$_LeaveReviewState _value, $Res Function(_$_LeaveReviewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? status = null,
    Object? reviewId = freezed,
  }) {
    return _then(_$_LeaveReviewState(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LeaveReviewState extends _LeaveReviewState {
  const _$_LeaveReviewState(
      {this.rating = 0, this.status = const AsyncData(null), this.reviewId})
      : super._();

  @override
  @JsonKey()
  final int rating;
  @override
  @JsonKey()
  final AsyncValue<void> status;
  @override
  final String? reviewId;

  @override
  String toString() {
    return 'LeaveReviewState(rating: $rating, status: $status, reviewId: $reviewId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeaveReviewState &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rating, status, reviewId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeaveReviewStateCopyWith<_$_LeaveReviewState> get copyWith =>
      __$$_LeaveReviewStateCopyWithImpl<_$_LeaveReviewState>(this, _$identity);
}

abstract class _LeaveReviewState extends LeaveReviewState {
  const factory _LeaveReviewState(
      {final int rating,
      final AsyncValue<void> status,
      final String? reviewId}) = _$_LeaveReviewState;
  const _LeaveReviewState._() : super._();

  @override
  int get rating;
  @override
  AsyncValue<void> get status;
  @override
  String? get reviewId;
  @override
  @JsonKey(ignore: true)
  _$$_LeaveReviewStateCopyWith<_$_LeaveReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
