import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/forms/change_password_form.dart';
import '../../../../constants/forms/error_text.dart';
import '../../../../themes/themes.dart';
import 'change_password_controller.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _currentPasswordTextController = TextEditingController();
  final _newPasswordTextController = TextEditingController();
  final _reTypePasswordTextController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordTextController.dispose();
    _newPasswordTextController.dispose();
    _reTypePasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: LTheme.profileViewFormInputDecoration,
      ),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: ChangePasswordFormConstants.currentPasswordField,
              controller: _currentPasswordTextController,
              decoration: const InputDecoration(
                  hintText:
                      ChangePasswordFormConstants.currentPasswordHintText),
              textInputAction: TextInputAction.next,
              obscureText: true,
              validator: FormBuilderValidators.required(),
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: ChangePasswordFormConstants.newPasswordField,
              controller: _newPasswordTextController,
              decoration: const InputDecoration(
                  hintText: ChangePasswordFormConstants.newPasswordHintText),
              textInputAction: TextInputAction.next,
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(
                  8,
                  errorText: ErrorTextConstants.passwordLengthErrorText,
                ),
              ]),
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: ChangePasswordFormConstants.reTypePasswordField,
              controller: _reTypePasswordTextController,
              decoration: const InputDecoration(
                  hintText: ChangePasswordFormConstants.reTypePasswordHintText),
              textInputAction: TextInputAction.done,
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                // * Equal validator not working
                // FormBuilderValidators.equal(
                //   _newPasswordTextController.text,
                // ),
                (reTypePassword) {
                  return reTypePassword != _newPasswordTextController.text
                      ? ErrorTextConstants.reTypePasswordDoesNotMatch
                      : null;
                }
              ]),
            ),
            Gaps.h8,
            const Divider(),
            Gaps.h8,
            Align(
              alignment: Alignment.centerRight,
              child: Consumer(builder: (context, ref, child) {
                final status = ref.watch(changePasswordControllerProvider);
                return FilledButton(
                  onPressed: status.isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(changePasswordControllerProvider.notifier)
                                .changePassword(
                                  _currentPasswordTextController.text,
                                  _newPasswordTextController.text,
                                );
                          }
                        },
                  child: Text(
                    'Save',
                    style: Theme.of(context).primaryTextTheme.labelLarge,
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
