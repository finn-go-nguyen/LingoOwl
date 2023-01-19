import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/forms/public_profile_edit_form.dart';
import '../../../../themes/themes.dart';
import '../../model/app_user.dart';
import 'profile_controller.dart';

class PublicProfileEditForm extends ConsumerStatefulWidget {
  const PublicProfileEditForm({
    super.key,
    required this.user,
  });

  final LAppUser user;

  @override
  ConsumerState<PublicProfileEditForm> createState() =>
      _PublicProfileEditFormState();
}

class _PublicProfileEditFormState extends ConsumerState<PublicProfileEditForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _headlineNameTextController = TextEditingController();
  final _websiteNameTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameTextController.text = widget.user.firstName;
    _lastNameTextController.text = widget.user.lastName ?? '';
    _headlineNameTextController.text = widget.user.headline ?? '';
    _websiteNameTextController.text = widget.user.website ?? '';
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _headlineNameTextController.dispose();
    _websiteNameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: LTheme.profileViewFormInputDecoration(),
      ),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basics:',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: PublicProfileEditFormConstants.firstNameField,
              controller: _firstNameTextController,
              decoration: const InputDecoration(hintText: 'First Name'),
              textInputAction: TextInputAction.next,
              validator: FormBuilderValidators.required(),
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: PublicProfileEditFormConstants.lastNameField,
              controller: _lastNameTextController,
              decoration: const InputDecoration(hintText: 'Last Name'),
              textInputAction: TextInputAction.next,
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: PublicProfileEditFormConstants.headlineField,
              controller: _headlineNameTextController,
              decoration: const InputDecoration(hintText: 'Headline'),
              textInputAction: TextInputAction.next,
              maxLength: 60,
            ),
            const Divider(),
            Text(
              'Links:',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: PublicProfileEditFormConstants.websiteField,
              controller: _websiteNameTextController,
              keyboardType: TextInputType.url,
              decoration:
                  const InputDecoration(hintText: 'Website (http(s)://..)'),
              validator: FormBuilderValidators.url(),
            ),
            Gaps.h16,
            Align(
              alignment: Alignment.centerRight,
              child: Consumer(builder: (context, ref, child) {
                final status = ref.watch(profileControllerProvider);
                return ElevatedButton(
                  onPressed: status.isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            final update = widget.user.copyWith(
                              firstName: _firstNameTextController.text,
                              lastName: _lastNameTextController.text,
                              headline: _headlineNameTextController.text,
                              website: _websiteNameTextController.text,
                            );
                            ref
                                .read(profileControllerProvider.notifier)
                                .save(update);
                          }
                        },
                  child: status.isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'Save',
                          style: Theme.of(context).textTheme.button,
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
