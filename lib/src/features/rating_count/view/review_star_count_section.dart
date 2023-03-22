import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../utils/formatter.dart';
import '../../../utils/text_style_helper.dart';
import '../../../widgets/common/rating_bar.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/loading.dart';
import '../data/rating_count_repository.dart';

class ReviewStarCountSection extends ConsumerWidget {
  const ReviewStarCountSection({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelper = ref.watch(textStyleHelperProvider(context));
    final starCountAsync = ref.watch(starCountProvider(courseId));

    return starCountAsync.when(
      loading: () => const LoadingState(),
      error: (error, stackTrace) =>
          ErrorState(message: error.runtimeType.toString()),
      data: (starCount) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Student Feedback',
            style: textStyleHelper.studentFeedback,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                starCount.average.toStringAsFixed(1),
                style: textStyleHelper.courseRating,
              ),
              Gaps.w8,
              Text(
                'course rating',
                style: textStyleHelper.description,
              ),
            ],
          ),
          ...starCount.stars.entries.map(
            (e) => PercentageBar(
              label: e.key,
              total: starCount.total,
              count: e.value.count,
            ),
          ),
        ],
      ),
    );
  }
}

class PercentageBar extends StatelessWidget {
  const PercentageBar({
    super.key,
    required this.label,
    required this.total,
    required this.count,
  }) : assert(label >= 1 && label <= 5);

  /// 1 -> 5
  final int label;

  final int total;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: UiParameters.borderRadius,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: LinearProgressIndicator(
                value: count / max(1, total), // Avoid divide by zero
                minHeight: 12.0,
                backgroundColor: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
          ),
          Gaps.w12,
          LRatingBarIndicator(rating: label.toDouble()),
          Gaps.w12,
          Consumer(
            builder: (context, ref, child) {
              final numberFormatter = ref.watch(compactNumberFormatterProvider);
              return Text(numberFormatter.format(count));
            },
          ),
        ],
      ),
    );
  }
}
