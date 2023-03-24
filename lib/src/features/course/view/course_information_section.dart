import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../utils/text_style_helper.dart';
import '../../../widgets/common/common.dart';

class CourseInformationSection extends ConsumerWidget {
  const CourseInformationSection({
    super.key,
    required this.name,
    required this.description,
    required this.instructorName,
    required this.courseId,
  });

  final String name;
  final String description;
  final String instructorName;
  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelper = ref.watch(textStyleHelperProvider(context));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: textStyleHelper.courseNameLarge,
        ),
        Gaps.h12,
        Text(
          description,
          style: textStyleHelper.description,
        ),
        Gaps.h12,
        LRatingBar(
          courseId: courseId,
        ),
        Gaps.h12,
        Text(
          'Created by $instructorName',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Gaps.h12,
        Row(
          children: [
            Icon(
              Icons.update,
              color: Theme.of(context).colorScheme.primary,
            ),
            Gaps.w8,
            const Text('Last update 1/2023'),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.public,
              color: Theme.of(context).colorScheme.primary,
            ),
            Gaps.w8,
            const Text('English'),
          ],
        ),
      ],
    );
  }
}
