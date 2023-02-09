import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/forms/account_create_form.dart';
import '../../../../constants/forms/error_text.dart';
import '../../../../widgets/common/common.dart';
import 'account_create_screen_controller.dart';

class AccountCreateForm extends ConsumerStatefulWidget {
  const AccountCreateForm({
    super.key,
  });

  @override
  ConsumerState<AccountCreateForm> createState() => _AccountCreateFormState();
}

class _AccountCreateFormState extends ConsumerState<AccountCreateForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        _formKey.currentState!.fields[AccountCreateFormConstants.nameField]!
            .validate();
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        _formKey.currentState!.fields[AccountCreateFormConstants.emailField]!
            .validate();
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        _formKey.currentState!.fields[AccountCreateFormConstants.passwordField]!
            .validate();
      }
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autoFocusOnValidationFailure: true,
      child: Column(
        children: [
          FormBuilderTextField(
            name: AccountCreateFormConstants.nameField,
            focusNode: _nameFocusNode,
            controller: _nameTextController,
            decoration: const InputDecoration(labelText: 'Name'),
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            validator: FormBuilderValidators.required(),
          ),
          Gaps.h32,
          FormBuilderTextField(
            name: AccountCreateFormConstants.emailField,
            focusNode: _emailFocusNode,
            controller: _emailTextController,
            decoration: const InputDecoration(labelText: 'Email'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(
                errorText: ErrorTextConstants.invalidEmailErrorText,
              ),
            ]),
          ),
          Gaps.h32,
          Consumer(
            builder: (context, ref, child) {
              final obscureText = ref.watch(
                  accountCreateScreenControllerProvider
                      .select((value) => value.obscureText));
              return FormBuilderTextField(
                name: AccountCreateFormConstants.passwordField,
                focusNode: _passwordFocusNode,
                controller: _passwordTextController,
                decoration: InputDecoration(
                  labelText: 'Password (8+ characters)',
                  suffixIcon: PasswordVisibilityToggleButton(
                    onPressed: ref
                        .read(accountCreateScreenControllerProvider.notifier)
                        .toggleObscureText,
                    isShown: !obscureText,
                  ),
                ),
                textInputAction: TextInputAction.done,
                obscureText: obscureText,
                keyboardType: TextInputType.text,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(
                    8,
                    errorText: ErrorTextConstants.passwordLengthErrorText,
                  ),
                ]),
              );
            },
          ),
          Gaps.h32,
          SizedBox.fromSize(
            size: const Size.fromHeight(60.0),
            child: Consumer(
              builder: (context, ref, child) {
                final status = ref.watch(accountCreateScreenControllerProvider
                    .select((state) => state.status));
                return ElevatedButton(
                  onPressed: status.isLoading
                      ? null
                      : () {
                          final isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            ref
                                .read(accountCreateScreenControllerProvider
                                    .notifier)
                                .onSubmitted(
                                  name: _nameTextController.text,
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text,
                                );
                          }
                        },
                  child: status.isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'Create Account',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
