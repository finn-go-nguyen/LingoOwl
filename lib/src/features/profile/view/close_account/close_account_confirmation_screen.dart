import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/forms/close_account_confirmation_form.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/common/scaffold.dart';
import 'close_account_controller.dart';

class CloseAccountConfirmationScreen extends ConsumerStatefulWidget {
  const CloseAccountConfirmationScreen({super.key});

  @override
  ConsumerState<CloseAccountConfirmationScreen> createState() =>
      _CloseAccountConfirmationScreenState();
}

class _CloseAccountConfirmationScreenState
    extends ConsumerState<CloseAccountConfirmationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: AppBar(
        title: const Text('Account security'),
      ),
      body: SingleChildScrollView(
        padding: UiParameters.screenPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Close your account?',
                  style: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            Gaps.h20,
            Text(
              'Are you sure you want to close your account?',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Gaps.h12,
            FormBuilder(
              key: _formKey,
              child: Theme(
                data: Theme.of(context).copyWith(
                  inputDecorationTheme: LTheme.profileViewFormInputDecoration(),
                ),
                child: FormBuilderTextField(
                  name: CloseAccountConfirmationFormConstants.passwordField,
                  controller: _passwordTextController,
                  decoration: const InputDecoration(
                    hintText:
                        CloseAccountConfirmationFormConstants.passwordHintText,
                  ),
                  obscureText: true,
                  validator: FormBuilderValidators.required(),
                  textInputAction: TextInputAction.go,
                ),
              ),
            ),
            Gaps.h20,
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: LTheme.alertButtonTheme().style,
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    ref
                        .read(closeAccountControllerProvider.notifier)
                        .closeAccount(_passwordTextController.text);
                  }
                },
                child: Text(
                  'Close account',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
