import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/app_constants/course_categories.dart';
import '../../constants/app_parameters/app_parameters.dart';
import '../dialog/alert_dialog.dart';

class BrowseCategories extends StatelessWidget {
  const BrowseCategories({
    super.key,
    this.hideTitle = false,
  });
  final bool hideTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!hideTitle)
          const Padding(
            padding: UiParameters.screenPadding,
            child: Text('Browse categories'),
          ),
        ...List.generate(
          courseCategories.length,
          (index) => ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            onTap: () => showNotImplementedAlertDialog(context: context),
            leading: FaIcon(
              courseCategories[index]['iconData'] as IconData,
              size: 22,
            ),
            title: Text(courseCategories[index]['name'] as String),
          ),
        ),
      ],
    );
  }
}
