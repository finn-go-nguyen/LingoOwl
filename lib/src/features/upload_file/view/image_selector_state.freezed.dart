// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_selector_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageSelectorState {
  bool get isUploadStarted => throw _privateConstructorUsedError;
  bool get isUploadCompleted => throw _privateConstructorUsedError;
  AsyncValue<void> get status => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageSelectorStateCopyWith<ImageSelectorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSelectorStateCopyWith<$Res> {
  factory $ImageSelectorStateCopyWith(
          ImageSelectorState value, $Res Function(ImageSelectorState) then) =
      _$ImageSelectorStateCopyWithImpl<$Res, ImageSelectorState>;
  @useResult
  $Res call(
      {bool isUploadStarted,
      bool isUploadCompleted,
      AsyncValue<void> status,
      double progress,
      String? downloadUrl});
}

/// @nodoc
class _$ImageSelectorStateCopyWithImpl<$Res, $Val extends ImageSelectorState>
    implements $ImageSelectorStateCopyWith<$Res> {
  _$ImageSelectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUploadStarted = null,
    Object? isUploadCompleted = null,
    Object? status = null,
    Object? progress = null,
    Object? downloadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isUploadStarted: null == isUploadStarted
          ? _value.isUploadStarted
          : isUploadStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadCompleted: null == isUploadCompleted
          ? _value.isUploadCompleted
          : isUploadCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageSelectorStateCopyWith<$Res>
    implements $ImageSelectorStateCopyWith<$Res> {
  factory _$$_ImageSelectorStateCopyWith(_$_ImageSelectorState value,
          $Res Function(_$_ImageSelectorState) then) =
      __$$_ImageSelectorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isUploadStarted,
      bool isUploadCompleted,
      AsyncValue<void> status,
      double progress,
      String? downloadUrl});
}

/// @nodoc
class __$$_ImageSelectorStateCopyWithImpl<$Res>
    extends _$ImageSelectorStateCopyWithImpl<$Res, _$_ImageSelectorState>
    implements _$$_ImageSelectorStateCopyWith<$Res> {
  __$$_ImageSelectorStateCopyWithImpl(
      _$_ImageSelectorState _value, $Res Function(_$_ImageSelectorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUploadStarted = null,
    Object? isUploadCompleted = null,
    Object? status = null,
    Object? progress = null,
    Object? downloadUrl = freezed,
  }) {
    return _then(_$_ImageSelectorState(
      isUploadStarted: null == isUploadStarted
          ? _value.isUploadStarted
          : isUploadStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadCompleted: null == isUploadCompleted
          ? _value.isUploadCompleted
          : isUploadCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ImageSelectorState extends _ImageSelectorState {
  const _$_ImageSelectorState(
      {this.isUploadStarted = false,
      this.isUploadCompleted = false,
      this.status = const AsyncData(null),
      this.progress = 0.0,
      this.downloadUrl})
      : super._();

  @override
  @JsonKey()
  final bool isUploadStarted;
  @override
  @JsonKey()
  final bool isUploadCompleted;
  @override
  @JsonKey()
  final AsyncValue<void> status;
  @override
  @JsonKey()
  final double progress;
  @override
  final String? downloadUrl;

  @override
  String toString() {
    return 'ImageSelectorState(isUploadStarted: $isUploadStarted, isUploadCompleted: $isUploadCompleted, status: $status, progress: $progress, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageSelectorState &&
            (identical(other.isUploadStarted, isUploadStarted) ||
                other.isUploadStarted == isUploadStarted) &&
            (identical(other.isUploadCompleted, isUploadCompleted) ||
                other.isUploadCompleted == isUploadCompleted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isUploadStarted,
      isUploadCompleted, status, progress, downloadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageSelectorStateCopyWith<_$_ImageSelectorState> get copyWith =>
      __$$_ImageSelectorStateCopyWithImpl<_$_ImageSelectorState>(
          this, _$identity);
}

abstract class _ImageSelectorState extends ImageSelectorState {
  const factory _ImageSelectorState(
      {final bool isUploadStarted,
      final bool isUploadCompleted,
      final AsyncValue<void> status,
      final double progress,
      final String? downloadUrl}) = _$_ImageSelectorState;
  const _ImageSelectorState._() : super._();

  @override
  bool get isUploadStarted;
  @override
  bool get isUploadCompleted;
  @override
  AsyncValue<void> get status;
  @override
  double get progress;
  @override
  String? get downloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ImageSelectorStateCopyWith<_$_ImageSelectorState> get copyWith =>
      throw _privateConstructorUsedError;
}
