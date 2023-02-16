// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoViewState {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get showController => throw _privateConstructorUsedError;
  AsyncValue<void> get status => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoViewStateCopyWith<VideoViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoViewStateCopyWith<$Res> {
  factory $VideoViewStateCopyWith(
          VideoViewState value, $Res Function(VideoViewState) then) =
      _$VideoViewStateCopyWithImpl<$Res, VideoViewState>;
  @useResult
  $Res call(
      {bool isInitialized,
      bool showController,
      AsyncValue<void> status,
      bool isPlaying,
      Duration position,
      Duration duration});
}

/// @nodoc
class _$VideoViewStateCopyWithImpl<$Res, $Val extends VideoViewState>
    implements $VideoViewStateCopyWith<$Res> {
  _$VideoViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? showController = null,
    Object? status = null,
    Object? isPlaying = null,
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      showController: null == showController
          ? _value.showController
          : showController // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoViewStateCopyWith<$Res>
    implements $VideoViewStateCopyWith<$Res> {
  factory _$$_VideoViewStateCopyWith(
          _$_VideoViewState value, $Res Function(_$_VideoViewState) then) =
      __$$_VideoViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitialized,
      bool showController,
      AsyncValue<void> status,
      bool isPlaying,
      Duration position,
      Duration duration});
}

/// @nodoc
class __$$_VideoViewStateCopyWithImpl<$Res>
    extends _$VideoViewStateCopyWithImpl<$Res, _$_VideoViewState>
    implements _$$_VideoViewStateCopyWith<$Res> {
  __$$_VideoViewStateCopyWithImpl(
      _$_VideoViewState _value, $Res Function(_$_VideoViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? showController = null,
    Object? status = null,
    Object? isPlaying = null,
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(_$_VideoViewState(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      showController: null == showController
          ? _value.showController
          : showController // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_VideoViewState implements _VideoViewState {
  const _$_VideoViewState(
      {this.isInitialized = false,
      this.showController = false,
      this.status = const AsyncLoading(),
      this.isPlaying = false,
      this.position = const Duration(),
      this.duration = const Duration()});

  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool showController;
  @override
  @JsonKey()
  final AsyncValue<void> status;
  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration duration;

  @override
  String toString() {
    return 'VideoViewState(isInitialized: $isInitialized, showController: $showController, status: $status, isPlaying: $isPlaying, position: $position, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoViewState &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.showController, showController) ||
                other.showController == showController) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitialized, showController,
      status, isPlaying, position, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoViewStateCopyWith<_$_VideoViewState> get copyWith =>
      __$$_VideoViewStateCopyWithImpl<_$_VideoViewState>(this, _$identity);
}

abstract class _VideoViewState implements VideoViewState {
  const factory _VideoViewState(
      {final bool isInitialized,
      final bool showController,
      final AsyncValue<void> status,
      final bool isPlaying,
      final Duration position,
      final Duration duration}) = _$_VideoViewState;

  @override
  bool get isInitialized;
  @override
  bool get showController;
  @override
  AsyncValue<void> get status;
  @override
  bool get isPlaying;
  @override
  Duration get position;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_VideoViewStateCopyWith<_$_VideoViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
