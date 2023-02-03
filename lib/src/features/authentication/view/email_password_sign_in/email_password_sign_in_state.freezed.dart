// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_password_sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailPasswordSignInState {
  String get email => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  AsyncValue<void> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailPasswordSignInStateCopyWith<EmailPasswordSignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailPasswordSignInStateCopyWith<$Res> {
  factory $EmailPasswordSignInStateCopyWith(EmailPasswordSignInState value,
          $Res Function(EmailPasswordSignInState) then) =
      _$EmailPasswordSignInStateCopyWithImpl<$Res, EmailPasswordSignInState>;
  @useResult
  $Res call({String email, bool obscureText, AsyncValue<void> status});
}

/// @nodoc
class _$EmailPasswordSignInStateCopyWithImpl<$Res,
        $Val extends EmailPasswordSignInState>
    implements $EmailPasswordSignInStateCopyWith<$Res> {
  _$EmailPasswordSignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? obscureText = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailPasswordSignInStateCopyWith<$Res>
    implements $EmailPasswordSignInStateCopyWith<$Res> {
  factory _$$_EmailPasswordSignInStateCopyWith(
          _$_EmailPasswordSignInState value,
          $Res Function(_$_EmailPasswordSignInState) then) =
      __$$_EmailPasswordSignInStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, bool obscureText, AsyncValue<void> status});
}

/// @nodoc
class __$$_EmailPasswordSignInStateCopyWithImpl<$Res>
    extends _$EmailPasswordSignInStateCopyWithImpl<$Res,
        _$_EmailPasswordSignInState>
    implements _$$_EmailPasswordSignInStateCopyWith<$Res> {
  __$$_EmailPasswordSignInStateCopyWithImpl(_$_EmailPasswordSignInState _value,
      $Res Function(_$_EmailPasswordSignInState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? obscureText = null,
    Object? status = null,
  }) {
    return _then(_$_EmailPasswordSignInState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
    ));
  }
}

/// @nodoc

class _$_EmailPasswordSignInState implements _EmailPasswordSignInState {
  const _$_EmailPasswordSignInState(
      {this.email = '',
      this.obscureText = true,
      this.status = const AsyncData(null)});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final bool obscureText;
  @override
  @JsonKey()
  final AsyncValue<void> status;

  @override
  String toString() {
    return 'EmailPasswordSignInState(email: $email, obscureText: $obscureText, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailPasswordSignInState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, obscureText, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailPasswordSignInStateCopyWith<_$_EmailPasswordSignInState>
      get copyWith => __$$_EmailPasswordSignInStateCopyWithImpl<
          _$_EmailPasswordSignInState>(this, _$identity);
}

abstract class _EmailPasswordSignInState implements EmailPasswordSignInState {
  const factory _EmailPasswordSignInState(
      {final String email,
      final bool obscureText,
      final AsyncValue<void> status}) = _$_EmailPasswordSignInState;

  @override
  String get email;
  @override
  bool get obscureText;
  @override
  AsyncValue<void> get status;
  @override
  @JsonKey(ignore: true)
  _$$_EmailPasswordSignInStateCopyWith<_$_EmailPasswordSignInState>
      get copyWith => throw _privateConstructorUsedError;
}
