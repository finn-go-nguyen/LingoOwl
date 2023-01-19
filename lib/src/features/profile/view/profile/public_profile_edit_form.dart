import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/forms/public_profile_edit_form.dart';
import '../../../../themes/themes.dart';

class PublicProfileEditForm extends StatefulWidget {
  const PublicProfileEditForm({super.key});

  @override
  State<PublicProfileEditForm> createState() => _PublicProfileEditFormState();
}

class _PublicProfileEditFormState extends State<PublicProfileEditForm> {
  final _formKey = GlobalKey<FormBuilderState>();
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
              decoration: const InputDecoration(hintText: 'First Name'),
              textInputAction: TextInputAction.next,
              validator: FormBuilderValidators.required(),
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: PublicProfileEditFormConstants.lastNameField,
              decoration: const InputDecoration(hintText: 'Last Name'),
              textInputAction: TextInputAction.next,
              validator: FormBuilderValidators.required(),
            ),
            Gaps.h16,
            FormBuilderTextField(
              name: PublicProfileEditFormConstants.headlineField,
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
              keyboardType: TextInputType.url,
              decoration:
                  const InputDecoration(hintText: 'Website (http(s)://..)'),
            ),
            Gaps.h16,
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
