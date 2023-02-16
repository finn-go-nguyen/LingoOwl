// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LSection _$LSectionFromJson(Map<String, dynamic> json) {
  return _LSection.fromJson(json);
}

/// @nodoc
mixin _$LSection {
  int get index => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LSectionCopyWith<LSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LSectionCopyWith<$Res> {
  factory $LSectionCopyWith(LSection value, $Res Function(LSection) then) =
      _$LSectionCopyWithImpl<$Res, LSection>;
  @useResult
  $Res call({int index, String name});
}

/// @nodoc
class _$LSectionCopyWithImpl<$Res, $Val extends LSection>
    implements $LSectionCopyWith<$Res> {
  _$LSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LSectionCopyWith<$Res> implements $LSectionCopyWith<$Res> {
  factory _$$_LSectionCopyWith(
          _$_LSection value, $Res Function(_$_LSection) then) =
      __$$_LSectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String name});
}

/// @nodoc
class __$$_LSectionCopyWithImpl<$Res>
    extends _$LSectionCopyWithImpl<$Res, _$_LSection>
    implements _$$_LSectionCopyWith<$Res> {
  __$$_LSectionCopyWithImpl(
      _$_LSection _value, $Res Function(_$_LSection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? name = null,
  }) {
    return _then(_$_LSection(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LSection implements _LSection {
  const _$_LSection({required this.index, required this.name});

  factory _$_LSection.fromJson(Map<String, dynamic> json) =>
      _$$_LSectionFromJson(json);

  @override
  final int index;
  @override
  final String name;

  @override
  String toString() {
    return 'LSection(index: $index, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LSection &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LSectionCopyWith<_$_LSection> get copyWith =>
      __$$_LSectionCopyWithImpl<_$_LSection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LSectionToJson(
      this,
    );
  }
}

abstract class _LSection implements LSection {
  const factory _LSection(
      {required final int index, required final String name}) = _$_LSection;

  factory _LSection.fromJson(Map<String, dynamic> json) = _$_LSection.fromJson;

  @override
  int get index;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_LSectionCopyWith<_$_LSection> get copyWith =>
      throw _privateConstructorUsedError;
}
