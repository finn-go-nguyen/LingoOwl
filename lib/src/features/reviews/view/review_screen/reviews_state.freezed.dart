// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewsState {
  List<LReview> get reviews => throw _privateConstructorUsedError;
  AsyncValue<void> get status => throw _privateConstructorUsedError;
  bool get noMoreItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewsStateCopyWith<ReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsStateCopyWith<$Res> {
  factory $ReviewsStateCopyWith(
          ReviewsState value, $Res Function(ReviewsState) then) =
      _$ReviewsStateCopyWithImpl<$Res, ReviewsState>;
  @useResult
  $Res call({List<LReview> reviews, AsyncValue<void> status, bool noMoreItem});
}

/// @nodoc
class _$ReviewsStateCopyWithImpl<$Res, $Val extends ReviewsState>
    implements $ReviewsStateCopyWith<$Res> {
  _$ReviewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? status = null,
    Object? noMoreItem = null,
  }) {
    return _then(_value.copyWith(
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<LReview>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      noMoreItem: null == noMoreItem
          ? _value.noMoreItem
          : noMoreItem // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewsStateCopyWith<$Res>
    implements $ReviewsStateCopyWith<$Res> {
  factory _$$_ReviewsStateCopyWith(
          _$_ReviewsState value, $Res Function(_$_ReviewsState) then) =
      __$$_ReviewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LReview> reviews, AsyncValue<void> status, bool noMoreItem});
}

/// @nodoc
class __$$_ReviewsStateCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$_ReviewsState>
    implements _$$_ReviewsStateCopyWith<$Res> {
  __$$_ReviewsStateCopyWithImpl(
      _$_ReviewsState _value, $Res Function(_$_ReviewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? status = null,
    Object? noMoreItem = null,
  }) {
    return _then(_$_ReviewsState(
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<LReview>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      noMoreItem: null == noMoreItem
          ? _value.noMoreItem
          : noMoreItem // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReviewsState implements _ReviewsState {
  const _$_ReviewsState(
      {final List<LReview> reviews = const <LReview>[],
      this.status = const AsyncLoading(),
      this.noMoreItem = false})
      : _reviews = reviews;

  final List<LReview> _reviews;
  @override
  @JsonKey()
  List<LReview> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @JsonKey()
  final AsyncValue<void> status;
  @override
  @JsonKey()
  final bool noMoreItem;

  @override
  String toString() {
    return 'ReviewsState(reviews: $reviews, status: $status, noMoreItem: $noMoreItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewsState &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.noMoreItem, noMoreItem) ||
                other.noMoreItem == noMoreItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_reviews), status, noMoreItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewsStateCopyWith<_$_ReviewsState> get copyWith =>
      __$$_ReviewsStateCopyWithImpl<_$_ReviewsState>(this, _$identity);
}

abstract class _ReviewsState implements ReviewsState {
  const factory _ReviewsState(
      {final List<LReview> reviews,
      final AsyncValue<void> status,
      final bool noMoreItem}) = _$_ReviewsState;

  @override
  List<LReview> get reviews;
  @override
  AsyncValue<void> get status;
  @override
  bool get noMoreItem;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewsStateCopyWith<_$_ReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
