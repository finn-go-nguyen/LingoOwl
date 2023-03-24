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
      error: (_, __) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressIndication(0.0),
          Gaps.h8,
          _buildPercentageText(0.0),
        ],
      ),
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
          _buildPercentageText(data),
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

  Widget _buildPercentageText(double data) {
    final text = data == 1 ? 'complete' : '${(data * 100).toInt()}% complete';
    return Builder(builder: (context) {
      return Row(
        children: [
          if (data == 1)
            Padding(
              padding: const EdgeInsets.only(right: Sizes.p4),
              child: Icon(
                Icons.verified,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
    });
  }
}
