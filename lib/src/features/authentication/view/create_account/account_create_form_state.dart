import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_create_form_state.freezed.dart';

@freezed
class AccountCreateFormState with _$AccountCreateFormState {
  const factory AccountCreateFormState({
    @Default(true) bool obscureText,
    @Default(AsyncData(null)) AsyncValue<void> status,
  }) = _AccountCreateFormState;
}
