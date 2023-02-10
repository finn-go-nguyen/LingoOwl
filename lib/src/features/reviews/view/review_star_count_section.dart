import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../utils/formatter.dart';
import '../../../utils/text_style_helper.dart';
import '../../../widgets/common/rating_bar.dart';
import '../model/star/star.dart';
import '../model/star_count/star_count.dart';

class ReviewStarCountSection extends ConsumerWidget {
  const ReviewStarCountSection({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelper = ref.watch(textStyleHelperProvider(context));
    // TODO: Get starCount from repository
    const starCount = LStarCount(stars: <int, LStar>{
      5: LStar.five(99),
      4: LStar.four(12),
      3: LStar.three(3),
      2: LStar.two(5),
      1: LStar.one(12),
    });

    final average = starCount.average;
    final total = starCount.total;
    return Column(
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
              average.toStringAsFixed(1),
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
            total: total,
            count: e.value.count,
          ),
        ),
      ],
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
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: LinearProgressIndicator(
              value: count / max(1, total), // Avoid divide by zero
              minHeight: 16.0,
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
