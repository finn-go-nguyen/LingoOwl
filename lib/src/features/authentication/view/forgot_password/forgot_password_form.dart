import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/forms/error_text.dart';
import '../../../../constants/forms/forgot_password_form.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
    this.email,
    required this.onResetEmailSent,
  });

  final String? email;
  final VoidCallback onResetEmailSent;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailTextController.text = widget.email ?? '';
  }

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
          child: Consumer(builder: (context, ref, child) {
            final status = ref.watch(forgotPasswordControllerProvider);
            return ElevatedButton(
              onPressed: status.isLoading
                  ? null
                  : () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final isValid = _formKey.currentState!.validate();
                      if (isValid) {
                        ref
                            .read(forgotPasswordControllerProvider.notifier)
                            .resetPassword(_emailTextController.text)
                            .then((succeed) {
                          if (succeed) widget.onResetEmailSent();
                        });
                      }
                    },
              child: status.isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      'Reset password',
                      style: Theme.of(context).textTheme.button!,
                    ),
            );
          }),
        )
      ]),
    );
  }
}
