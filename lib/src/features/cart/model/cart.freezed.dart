// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LCart _$LCartFromJson(Map<String, dynamic> json) {
  return _LCart.fromJson(json);
}

/// @nodoc
mixin _$LCart {
  /// Key: courseId, value: timeStamp in milliseconds
  Map<String, int> get courses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LCartCopyWith<LCart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LCartCopyWith<$Res> {
  factory $LCartCopyWith(LCart value, $Res Function(LCart) then) =
      _$LCartCopyWithImpl<$Res, LCart>;
  @useResult
  $Res call({Map<String, int> courses});
}

/// @nodoc
class _$LCartCopyWithImpl<$Res, $Val extends LCart>
    implements $LCartCopyWith<$Res> {
  _$LCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_value.copyWith(
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LCartCopyWith<$Res> implements $LCartCopyWith<$Res> {
  factory _$$_LCartCopyWith(_$_LCart value, $Res Function(_$_LCart) then) =
      __$$_LCartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, int> courses});
}

/// @nodoc
class __$$_LCartCopyWithImpl<$Res> extends _$LCartCopyWithImpl<$Res, _$_LCart>
    implements _$$_LCartCopyWith<$Res> {
  __$$_LCartCopyWithImpl(_$_LCart _value, $Res Function(_$_LCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_$_LCart(
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LCart extends _LCart {
  const _$_LCart(
      {final Map<String, int> courses = const <CourseId, TimeStamp>{}})
      : _courses = courses,
        super._();

  factory _$_LCart.fromJson(Map<String, dynamic> json) =>
      _$$_LCartFromJson(json);

  /// Key: courseId, value: timeStamp in milliseconds
  final Map<String, int> _courses;

  /// Key: courseId, value: timeStamp in milliseconds
  @override
  @JsonKey()
  Map<String, int> get courses {
    if (_courses is EqualUnmodifiableMapView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_courses);
  }

  @override
  String toString() {
    return 'LCart(courses: $courses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LCart &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LCartCopyWith<_$_LCart> get copyWith =>
      __$$_LCartCopyWithImpl<_$_LCart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LCartToJson(
      this,
    );
  }
}

abstract class _LCart extends LCart {
  const factory _LCart({final Map<String, int> courses}) = _$_LCart;
  const _LCart._() : super._();

  factory _LCart.fromJson(Map<String, dynamic> json) = _$_LCart.fromJson;

  @override

  /// Key: courseId, value: timeStamp in milliseconds
  Map<String, int> get courses;
  @override
  @JsonKey(ignore: true)
  _$$_LCartCopyWith<_$_LCart> get copyWith =>
      throw _privateConstructorUsedError;
}
