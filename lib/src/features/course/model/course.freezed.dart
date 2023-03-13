// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LCourse _$LCourseFromJson(Map<String, dynamic> json) {
  return _LCourse.fromJson(json);
}

/// @nodoc
mixin _$LCourse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get instructorName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get salePrice => throw _privateConstructorUsedError;
  List<String> get youWillLearn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LCourseCopyWith<LCourse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LCourseCopyWith<$Res> {
  factory $LCourseCopyWith(LCourse value, $Res Function(LCourse) then) =
      _$LCourseCopyWithImpl<$Res, LCourse>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String thumbnail,
      String instructorName,
      double price,
      double? salePrice,
      List<String> youWillLearn});
}

/// @nodoc
class _$LCourseCopyWithImpl<$Res, $Val extends LCourse>
    implements $LCourseCopyWith<$Res> {
  _$LCourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? instructorName = null,
    Object? price = null,
    Object? salePrice = freezed,
    Object? youWillLearn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      instructorName: null == instructorName
          ? _value.instructorName
          : instructorName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      youWillLearn: null == youWillLearn
          ? _value.youWillLearn
          : youWillLearn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LCourseCopyWith<$Res> implements $LCourseCopyWith<$Res> {
  factory _$$_LCourseCopyWith(
          _$_LCourse value, $Res Function(_$_LCourse) then) =
      __$$_LCourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String thumbnail,
      String instructorName,
      double price,
      double? salePrice,
      List<String> youWillLearn});
}

/// @nodoc
class __$$_LCourseCopyWithImpl<$Res>
    extends _$LCourseCopyWithImpl<$Res, _$_LCourse>
    implements _$$_LCourseCopyWith<$Res> {
  __$$_LCourseCopyWithImpl(_$_LCourse _value, $Res Function(_$_LCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? instructorName = null,
    Object? price = null,
    Object? salePrice = freezed,
    Object? youWillLearn = null,
  }) {
    return _then(_$_LCourse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      instructorName: null == instructorName
          ? _value.instructorName
          : instructorName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      youWillLearn: null == youWillLearn
          ? _value._youWillLearn
          : youWillLearn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LCourse extends _LCourse {
  const _$_LCourse(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail,
      required this.instructorName,
      required this.price,
      this.salePrice,
      required final List<String> youWillLearn})
      : _youWillLearn = youWillLearn,
        super._();

  factory _$_LCourse.fromJson(Map<String, dynamic> json) =>
      _$$_LCourseFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String thumbnail;
  @override
  final String instructorName;
  @override
  final double price;
  @override
  final double? salePrice;
  final List<String> _youWillLearn;
  @override
  List<String> get youWillLearn {
    if (_youWillLearn is EqualUnmodifiableListView) return _youWillLearn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_youWillLearn);
  }

  @override
  String toString() {
    return 'LCourse(id: $id, name: $name, description: $description, thumbnail: $thumbnail, instructorName: $instructorName, price: $price, salePrice: $salePrice, youWillLearn: $youWillLearn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LCourse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.instructorName, instructorName) ||
                other.instructorName == instructorName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            const DeepCollectionEquality()
                .equals(other._youWillLearn, _youWillLearn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      thumbnail,
      instructorName,
      price,
      salePrice,
      const DeepCollectionEquality().hash(_youWillLearn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LCourseCopyWith<_$_LCourse> get copyWith =>
      __$$_LCourseCopyWithImpl<_$_LCourse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LCourseToJson(
      this,
    );
  }
}

abstract class _LCourse extends LCourse {
  const factory _LCourse(
      {required final String id,
      required final String name,
      required final String description,
      required final String thumbnail,
      required final String instructorName,
      required final double price,
      final double? salePrice,
      required final List<String> youWillLearn}) = _$_LCourse;
  const _LCourse._() : super._();

  factory _LCourse.fromJson(Map<String, dynamic> json) = _$_LCourse.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get thumbnail;
  @override
  String get instructorName;
  @override
  double get price;
  @override
  double? get salePrice;
  @override
  List<String> get youWillLearn;
  @override
  @JsonKey(ignore: true)
  _$$_LCourseCopyWith<_$_LCourse> get copyWith =>
      throw _privateConstructorUsedError;
}
