// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LAppUser _$LAppUserFromJson(Map<String, dynamic> json) {
  return _LAppUser.fromJson(json);
}

/// @nodoc
mixin _$LAppUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get headline => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LAppUserCopyWith<LAppUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LAppUserCopyWith<$Res> {
  factory $LAppUserCopyWith(LAppUser value, $Res Function(LAppUser) then) =
      _$LAppUserCopyWithImpl<$Res, LAppUser>;
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String? lastName,
      String? headline,
      String? website,
      String? photoUrl});
}

/// @nodoc
class _$LAppUserCopyWithImpl<$Res, $Val extends LAppUser>
    implements $LAppUserCopyWith<$Res> {
  _$LAppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? headline = freezed,
    Object? website = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      headline: freezed == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LAppUserCopyWith<$Res> implements $LAppUserCopyWith<$Res> {
  factory _$$_LAppUserCopyWith(
          _$_LAppUser value, $Res Function(_$_LAppUser) then) =
      __$$_LAppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String? lastName,
      String? headline,
      String? website,
      String? photoUrl});
}

/// @nodoc
class __$$_LAppUserCopyWithImpl<$Res>
    extends _$LAppUserCopyWithImpl<$Res, _$_LAppUser>
    implements _$$_LAppUserCopyWith<$Res> {
  __$$_LAppUserCopyWithImpl(
      _$_LAppUser _value, $Res Function(_$_LAppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? headline = freezed,
    Object? website = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$_LAppUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      headline: freezed == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LAppUser extends _LAppUser {
  const _$_LAppUser(
      {required this.id,
      required this.email,
      required this.firstName,
      this.lastName,
      this.headline,
      this.website,
      this.photoUrl})
      : super._();

  factory _$_LAppUser.fromJson(Map<String, dynamic> json) =>
      _$$_LAppUserFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String? lastName;
  @override
  final String? headline;
  @override
  final String? website;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'LAppUser(id: $id, email: $email, firstName: $firstName, lastName: $lastName, headline: $headline, website: $website, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LAppUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, firstName, lastName, headline, website, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LAppUserCopyWith<_$_LAppUser> get copyWith =>
      __$$_LAppUserCopyWithImpl<_$_LAppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LAppUserToJson(
      this,
    );
  }
}

abstract class _LAppUser extends LAppUser {
  const factory _LAppUser(
      {required final String id,
      required final String email,
      required final String firstName,
      final String? lastName,
      final String? headline,
      final String? website,
      final String? photoUrl}) = _$_LAppUser;
  const _LAppUser._() : super._();

  factory _LAppUser.fromJson(Map<String, dynamic> json) = _$_LAppUser.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String? get lastName;
  @override
  String? get headline;
  @override
  String? get website;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$_LAppUserCopyWith<_$_LAppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
