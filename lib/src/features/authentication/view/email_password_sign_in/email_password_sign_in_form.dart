import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/forms/email_password_sign_in_form.dart';
import '../../../../constants/forms/error_text.dart';
import '../../../../constants/forms/forgot_password_form.dart';
import '../../../../router/app_router.dart';
import '../../../../widgets/common/password_visibility_toggle_button.dart';
import 'email_password_sign_in_controller.dart';

class EmailForm extends ConsumerStatefulWidget {
  const EmailForm({
    super.key,
    required this.onSubmitted,
  });

  final VoidCallback onSubmitted;

  @override
  ConsumerState<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends ConsumerState<EmailForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(children: [
        FormBuilderTextField(
          name: ForgotPasswordFormConstants.emailField,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Email'),
          controller: _emailTextController,
          keyboardType: TextInputType.emailAddress,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(
              errorText: ErrorTextConstants.invalidEmailErrorText,
            ),
          ]),
        ),
        Gaps.h20,
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
                ref
                    .read(emailPasswordSignInControllerProvider.notifier)
                    .setEmail(_emailTextController.text);
                widget.onSubmitted();
              }
            },
            child: Text(
              'Next',
              style: Theme.of(context).textTheme.button!,
            ),
          ),
        )
      ]),
    );
  }
}

class PasswordForm extends ConsumerStatefulWidget {
  const PasswordForm({super.key});

  @override
  ConsumerState<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends ConsumerState<PasswordForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final obscureText = ref.watch(emailPasswordSignInControllerProvider
                .select((value) => value.obscureText));
            return FormBuilderTextField(
              name: EmailPasswordSignInFormConstants.passwordField,
              autofocus: true,
              controller: _passwordTextController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffix: PasswordVisibilityToggleButton(
                  onPressed: ref
                      .read(emailPasswordSignInControllerProvider.notifier)
                      .toggleObscureText,
                  isShown: !obscureText,
                ),
              ),
              textInputAction: TextInputAction.done,
              obscureText: obscureText,
              keyboardType: TextInputType.text,
              validator: FormBuilderValidators.required(),
            );
          }),
          Gaps.h24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => context.pushNamed(
                  LRoutes.forgotPassword.name,
                  extra: ref.read(emailPasswordSignInControllerProvider).email,
                ),
                child: const Text('Forgot password'),
              ),
              Consumer(
                builder: (context, ref, child) {
                  var status = ref.watch(emailPasswordSignInControllerProvider
                      .select((value) => value.status));
                  return ElevatedButton(
                    onPressed: status.isLoading
                        ? null
                        : () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            final isValid = _formKey.currentState!.validate();
                            if (isValid) {
                              ref
                                  .read(emailPasswordSignInControllerProvider
                                      .notifier)
                                  .signInWithEmailAndPassword(
                                      _passwordTextController.text);
                            }
                          },
                    child: status.isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            'Sign In',
                            style: Theme.of(context).textTheme.button!,
                          ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
