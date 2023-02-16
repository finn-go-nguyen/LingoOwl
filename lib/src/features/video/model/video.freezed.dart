// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LVideo _$LVideoFromJson(Map<String, dynamic> json) {
  return _LVideo.fromJson(json);
}

/// @nodoc
mixin _$LVideo {
  /// seconds
  int get duration => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LVideoCopyWith<LVideo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LVideoCopyWith<$Res> {
  factory $LVideoCopyWith(LVideo value, $Res Function(LVideo) then) =
      _$LVideoCopyWithImpl<$Res, LVideo>;
  @useResult
  $Res call({int duration, String url});
}

/// @nodoc
class _$LVideoCopyWithImpl<$Res, $Val extends LVideo>
    implements $LVideoCopyWith<$Res> {
  _$LVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LVideoCopyWith<$Res> implements $LVideoCopyWith<$Res> {
  factory _$$_LVideoCopyWith(_$_LVideo value, $Res Function(_$_LVideo) then) =
      __$$_LVideoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int duration, String url});
}

/// @nodoc
class __$$_LVideoCopyWithImpl<$Res>
    extends _$LVideoCopyWithImpl<$Res, _$_LVideo>
    implements _$$_LVideoCopyWith<$Res> {
  __$$_LVideoCopyWithImpl(_$_LVideo _value, $Res Function(_$_LVideo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? url = null,
  }) {
    return _then(_$_LVideo(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LVideo implements _LVideo {
  const _$_LVideo({required this.duration, required this.url});

  factory _$_LVideo.fromJson(Map<String, dynamic> json) =>
      _$$_LVideoFromJson(json);

  /// seconds
  @override
  final int duration;
  @override
  final String url;

  @override
  String toString() {
    return 'LVideo(duration: $duration, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LVideo &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, duration, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LVideoCopyWith<_$_LVideo> get copyWith =>
      __$$_LVideoCopyWithImpl<_$_LVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LVideoToJson(
      this,
    );
  }
}

abstract class _LVideo implements LVideo {
  const factory _LVideo(
      {required final int duration, required final String url}) = _$_LVideo;

  factory _LVideo.fromJson(Map<String, dynamic> json) = _$_LVideo.fromJson;

  @override

  /// seconds
  int get duration;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_LVideoCopyWith<_$_LVideo> get copyWith =>
      throw _privateConstructorUsedError;
}
