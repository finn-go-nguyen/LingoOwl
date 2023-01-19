// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploaded_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LUploadedFile {
  String get uid => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  void Function()? get whenUploadCompleted =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LUploadedFileCopyWith<LUploadedFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LUploadedFileCopyWith<$Res> {
  factory $LUploadedFileCopyWith(
          LUploadedFile value, $Res Function(LUploadedFile) then) =
      _$LUploadedFileCopyWithImpl<$Res, LUploadedFile>;
  @useResult
  $Res call(
      {String uid, String filePath, void Function()? whenUploadCompleted});
}

/// @nodoc
class _$LUploadedFileCopyWithImpl<$Res, $Val extends LUploadedFile>
    implements $LUploadedFileCopyWith<$Res> {
  _$LUploadedFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? filePath = null,
    Object? whenUploadCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      whenUploadCompleted: freezed == whenUploadCompleted
          ? _value.whenUploadCompleted
          : whenUploadCompleted // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LUploadedFileCopyWith<$Res>
    implements $LUploadedFileCopyWith<$Res> {
  factory _$$_LUploadedFileCopyWith(
          _$_LUploadedFile value, $Res Function(_$_LUploadedFile) then) =
      __$$_LUploadedFileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid, String filePath, void Function()? whenUploadCompleted});
}

/// @nodoc
class __$$_LUploadedFileCopyWithImpl<$Res>
    extends _$LUploadedFileCopyWithImpl<$Res, _$_LUploadedFile>
    implements _$$_LUploadedFileCopyWith<$Res> {
  __$$_LUploadedFileCopyWithImpl(
      _$_LUploadedFile _value, $Res Function(_$_LUploadedFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? filePath = null,
    Object? whenUploadCompleted = freezed,
  }) {
    return _then(_$_LUploadedFile(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      whenUploadCompleted: freezed == whenUploadCompleted
          ? _value.whenUploadCompleted
          : whenUploadCompleted // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ));
  }
}

/// @nodoc

class _$_LUploadedFile implements _LUploadedFile {
  const _$_LUploadedFile(
      {required this.uid, required this.filePath, this.whenUploadCompleted});

  @override
  final String uid;
  @override
  final String filePath;
  @override
  final void Function()? whenUploadCompleted;

  @override
  String toString() {
    return 'LUploadedFile(uid: $uid, filePath: $filePath, whenUploadCompleted: $whenUploadCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LUploadedFile &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.whenUploadCompleted, whenUploadCompleted) ||
                other.whenUploadCompleted == whenUploadCompleted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, filePath, whenUploadCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LUploadedFileCopyWith<_$_LUploadedFile> get copyWith =>
      __$$_LUploadedFileCopyWithImpl<_$_LUploadedFile>(this, _$identity);
}

abstract class _LUploadedFile implements LUploadedFile {
  const factory _LUploadedFile(
      {required final String uid,
      required final String filePath,
      final void Function()? whenUploadCompleted}) = _$_LUploadedFile;

  @override
  String get uid;
  @override
  String get filePath;
  @override
  void Function()? get whenUploadCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_LUploadedFileCopyWith<_$_LUploadedFile> get copyWith =>
      throw _privateConstructorUsedError;
}
