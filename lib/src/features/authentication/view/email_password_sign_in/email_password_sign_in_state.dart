import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_password_sign_in_state.freezed.dart';

@freezed
class EmailPasswordSignInState with _$EmailPasswordSignInState {
  const factory EmailPasswordSignInState({
    @Default('') String email,
    @Default(false) bool obscureText,
    @Default(AsyncData(null)) AsyncValue<void> status,
  }) = _EmailPasswordSignInState;
}
