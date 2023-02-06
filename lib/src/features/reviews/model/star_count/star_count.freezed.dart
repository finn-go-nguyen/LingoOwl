// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'star_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LStarCount _$LStarCountFromJson(Map<String, dynamic> json) {
  return _LStarCount.fromJson(json);
}

/// @nodoc
mixin _$LStarCount {
  Map<int, LStar> get stars => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LStarCountCopyWith<LStarCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LStarCountCopyWith<$Res> {
  factory $LStarCountCopyWith(
          LStarCount value, $Res Function(LStarCount) then) =
      _$LStarCountCopyWithImpl<$Res, LStarCount>;
  @useResult
  $Res call({Map<int, LStar> stars});
}

/// @nodoc
class _$LStarCountCopyWithImpl<$Res, $Val extends LStarCount>
    implements $LStarCountCopyWith<$Res> {
  _$LStarCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stars = null,
  }) {
    return _then(_value.copyWith(
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as Map<int, LStar>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LStarCountCopyWith<$Res>
    implements $LStarCountCopyWith<$Res> {
  factory _$$_LStarCountCopyWith(
          _$_LStarCount value, $Res Function(_$_LStarCount) then) =
      __$$_LStarCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, LStar> stars});
}

/// @nodoc
class __$$_LStarCountCopyWithImpl<$Res>
    extends _$LStarCountCopyWithImpl<$Res, _$_LStarCount>
    implements _$$_LStarCountCopyWith<$Res> {
  __$$_LStarCountCopyWithImpl(
      _$_LStarCount _value, $Res Function(_$_LStarCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stars = null,
  }) {
    return _then(_$_LStarCount(
      stars: null == stars
          ? _value._stars
          : stars // ignore: cast_nullable_to_non_nullable
              as Map<int, LStar>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LStarCount extends _LStarCount {
  const _$_LStarCount(
      {final Map<int, LStar> stars = const <int, LStar>{
        5: LStar.five(0),
        4: LStar.four(0),
        3: LStar.three(0),
        2: LStar.two(0),
        1: LStar.one(0)
      }})
      : _stars = stars,
        super._();

  factory _$_LStarCount.fromJson(Map<String, dynamic> json) =>
      _$$_LStarCountFromJson(json);

  final Map<int, LStar> _stars;
  @override
  @JsonKey()
  Map<int, LStar> get stars {
    if (_stars is EqualUnmodifiableMapView) return _stars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stars);
  }

  @override
  String toString() {
    return 'LStarCount(stars: $stars)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LStarCount &&
            const DeepCollectionEquality().equals(other._stars, _stars));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_stars));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LStarCountCopyWith<_$_LStarCount> get copyWith =>
      __$$_LStarCountCopyWithImpl<_$_LStarCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LStarCountToJson(
      this,
    );
  }
}

abstract class _LStarCount extends LStarCount {
  const factory _LStarCount({final Map<int, LStar> stars}) = _$_LStarCount;
  const _LStarCount._() : super._();

  factory _LStarCount.fromJson(Map<String, dynamic> json) =
      _$_LStarCount.fromJson;

  @override
  Map<int, LStar> get stars;
  @override
  @JsonKey(ignore: true)
  _$$_LStarCountCopyWith<_$_LStarCount> get copyWith =>
      throw _privateConstructorUsedError;
}
