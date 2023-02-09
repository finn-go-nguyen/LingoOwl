// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LWishList _$LWishListFromJson(Map<String, dynamic> json) {
  return _LWishList.fromJson(json);
}

/// @nodoc
mixin _$LWishList {
  /// Key: courseId, value: timeStamp in milliseconds
  Map<String, int> get courses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LWishListCopyWith<LWishList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LWishListCopyWith<$Res> {
  factory $LWishListCopyWith(LWishList value, $Res Function(LWishList) then) =
      _$LWishListCopyWithImpl<$Res, LWishList>;
  @useResult
  $Res call({Map<String, int> courses});
}

/// @nodoc
class _$LWishListCopyWithImpl<$Res, $Val extends LWishList>
    implements $LWishListCopyWith<$Res> {
  _$LWishListCopyWithImpl(this._value, this._then);

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
abstract class _$$_LWishListCopyWith<$Res> implements $LWishListCopyWith<$Res> {
  factory _$$_LWishListCopyWith(
          _$_LWishList value, $Res Function(_$_LWishList) then) =
      __$$_LWishListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, int> courses});
}

/// @nodoc
class __$$_LWishListCopyWithImpl<$Res>
    extends _$LWishListCopyWithImpl<$Res, _$_LWishList>
    implements _$$_LWishListCopyWith<$Res> {
  __$$_LWishListCopyWithImpl(
      _$_LWishList _value, $Res Function(_$_LWishList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courses = null,
  }) {
    return _then(_$_LWishList(
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LWishList extends _LWishList {
  const _$_LWishList(
      {final Map<String, int> courses = const <CourseId, TimeStamp>{}})
      : _courses = courses,
        super._();

  factory _$_LWishList.fromJson(Map<String, dynamic> json) =>
      _$$_LWishListFromJson(json);

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
    return 'LWishList(courses: $courses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LWishList &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LWishListCopyWith<_$_LWishList> get copyWith =>
      __$$_LWishListCopyWithImpl<_$_LWishList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LWishListToJson(
      this,
    );
  }
}

abstract class _LWishList extends LWishList {
  const factory _LWishList({final Map<String, int> courses}) = _$_LWishList;
  const _LWishList._() : super._();

  factory _LWishList.fromJson(Map<String, dynamic> json) =
      _$_LWishList.fromJson;

  @override

  /// Key: courseId, value: timeStamp in milliseconds
  Map<String, int> get courses;
  @override
  @JsonKey(ignore: true)
  _$$_LWishListCopyWith<_$_LWishList> get copyWith =>
      throw _privateConstructorUsedError;
}
