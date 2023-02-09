// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_create_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountCreateFormState {
  bool get obscureText => throw _privateConstructorUsedError;
  AsyncValue<void> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountCreateFormStateCopyWith<AccountCreateFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCreateFormStateCopyWith<$Res> {
  factory $AccountCreateFormStateCopyWith(AccountCreateFormState value,
          $Res Function(AccountCreateFormState) then) =
      _$AccountCreateFormStateCopyWithImpl<$Res, AccountCreateFormState>;
  @useResult
  $Res call({bool obscureText, AsyncValue<void> status});
}

/// @nodoc
class _$AccountCreateFormStateCopyWithImpl<$Res,
        $Val extends AccountCreateFormState>
    implements $AccountCreateFormStateCopyWith<$Res> {
  _$AccountCreateFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obscureText = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_AccountCreateFormStateCopyWith<$Res>
    implements $AccountCreateFormStateCopyWith<$Res> {
  factory _$$_AccountCreateFormStateCopyWith(_$_AccountCreateFormState value,
          $Res Function(_$_AccountCreateFormState) then) =
      __$$_AccountCreateFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool obscureText, AsyncValue<void> status});
}

/// @nodoc
class __$$_AccountCreateFormStateCopyWithImpl<$Res>
    extends _$AccountCreateFormStateCopyWithImpl<$Res,
        _$_AccountCreateFormState>
    implements _$$_AccountCreateFormStateCopyWith<$Res> {
  __$$_AccountCreateFormStateCopyWithImpl(_$_AccountCreateFormState _value,
      $Res Function(_$_AccountCreateFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obscureText = null,
    Object? status = null,
  }) {
    return _then(_$_AccountCreateFormState(
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

class _$_AccountCreateFormState implements _AccountCreateFormState {
  const _$_AccountCreateFormState(
      {this.obscureText = true, this.status = const AsyncData(null)});

  @override
  @JsonKey()
  final bool obscureText;
  @override
  @JsonKey()
  final AsyncValue<void> status;

  @override
  String toString() {
    return 'AccountCreateFormState(obscureText: $obscureText, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountCreateFormState &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, obscureText, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountCreateFormStateCopyWith<_$_AccountCreateFormState> get copyWith =>
      __$$_AccountCreateFormStateCopyWithImpl<_$_AccountCreateFormState>(
          this, _$identity);
}

abstract class _AccountCreateFormState implements AccountCreateFormState {
  const factory _AccountCreateFormState(
      {final bool obscureText,
      final AsyncValue<void> status}) = _$_AccountCreateFormState;

  @override
  bool get obscureText;
  @override
  AsyncValue<void> get status;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCreateFormStateCopyWith<_$_AccountCreateFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
