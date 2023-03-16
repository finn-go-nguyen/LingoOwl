import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_sizes.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../data/course_progress_repository.dart';

class CourseProgressBar extends ConsumerWidget {
  const CourseProgressBar({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final percentageValue = ref.watch(progressPercentageProvider(courseId));
    return percentageValue.when(
      error: (_, __) => const SizedBox.shrink(),
      loading: () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressIndication(),
          Gaps.h24,
        ],
      ),
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressIndication(data),
          Gaps.h8,
          Text(
            '${(data * 100).toInt()}% complete',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndication([double? data]) {
    return Builder(builder: (context) {
      return LinearProgressIndicator(
        value: data,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      );
    });
  }
}
