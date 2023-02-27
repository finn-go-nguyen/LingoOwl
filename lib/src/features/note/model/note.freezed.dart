// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LNote _$LNoteFromJson(Map<String, dynamic> json) {
  return _LNote.fromJson(json);
}

/// @nodoc
mixin _$LNote {
  String get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  int get lectureIndex => throw _privateConstructorUsedError;
  int get atSeconds => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get timeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LNoteCopyWith<LNote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LNoteCopyWith<$Res> {
  factory $LNoteCopyWith(LNote value, $Res Function(LNote) then) =
      _$LNoteCopyWithImpl<$Res, LNote>;
  @useResult
  $Res call(
      {String id,
      String courseId,
      int lectureIndex,
      int atSeconds,
      String content,
      int timeStamp});
}

/// @nodoc
class _$LNoteCopyWithImpl<$Res, $Val extends LNote>
    implements $LNoteCopyWith<$Res> {
  _$LNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? lectureIndex = null,
    Object? atSeconds = null,
    Object? content = null,
    Object? timeStamp = null,
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
      lectureIndex: null == lectureIndex
          ? _value.lectureIndex
          : lectureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      atSeconds: null == atSeconds
          ? _value.atSeconds
          : atSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LNoteCopyWith<$Res> implements $LNoteCopyWith<$Res> {
  factory _$$_LNoteCopyWith(_$_LNote value, $Res Function(_$_LNote) then) =
      __$$_LNoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String courseId,
      int lectureIndex,
      int atSeconds,
      String content,
      int timeStamp});
}

/// @nodoc
class __$$_LNoteCopyWithImpl<$Res> extends _$LNoteCopyWithImpl<$Res, _$_LNote>
    implements _$$_LNoteCopyWith<$Res> {
  __$$_LNoteCopyWithImpl(_$_LNote _value, $Res Function(_$_LNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? lectureIndex = null,
    Object? atSeconds = null,
    Object? content = null,
    Object? timeStamp = null,
  }) {
    return _then(_$_LNote(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      lectureIndex: null == lectureIndex
          ? _value.lectureIndex
          : lectureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      atSeconds: null == atSeconds
          ? _value.atSeconds
          : atSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LNote extends _LNote {
  const _$_LNote(
      {required this.id,
      required this.courseId,
      required this.lectureIndex,
      required this.atSeconds,
      required this.content,
      required this.timeStamp})
      : super._();

  factory _$_LNote.fromJson(Map<String, dynamic> json) =>
      _$$_LNoteFromJson(json);

  @override
  final String id;
  @override
  final String courseId;
  @override
  final int lectureIndex;
  @override
  final int atSeconds;
  @override
  final String content;
  @override
  final int timeStamp;

  @override
  String toString() {
    return 'LNote(id: $id, courseId: $courseId, lectureIndex: $lectureIndex, atSeconds: $atSeconds, content: $content, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LNote &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.lectureIndex, lectureIndex) ||
                other.lectureIndex == lectureIndex) &&
            (identical(other.atSeconds, atSeconds) ||
                other.atSeconds == atSeconds) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, courseId, lectureIndex, atSeconds, content, timeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LNoteCopyWith<_$_LNote> get copyWith =>
      __$$_LNoteCopyWithImpl<_$_LNote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LNoteToJson(
      this,
    );
  }
}

abstract class _LNote extends LNote {
  const factory _LNote(
      {required final String id,
      required final String courseId,
      required final int lectureIndex,
      required final int atSeconds,
      required final String content,
      required final int timeStamp}) = _$_LNote;
  const _LNote._() : super._();

  factory _LNote.fromJson(Map<String, dynamic> json) = _$_LNote.fromJson;

  @override
  String get id;
  @override
  String get courseId;
  @override
  int get lectureIndex;
  @override
  int get atSeconds;
  @override
  String get content;
  @override
  int get timeStamp;
  @override
  @JsonKey(ignore: true)
  _$$_LNoteCopyWith<_$_LNote> get copyWith =>
      throw _privateConstructorUsedError;
}
