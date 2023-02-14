import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../constants/app_parameters/app_parameters.dart';
import '../../constants/type_defs/type_defs.dart';
import '../../features/rating_count/data/rating_count_repository.dart';
import '../../themes/colors.dart';
import '../../utils/text_style_helper.dart';
import '../state/loading/rating/rating_bar_loading.dart';

class LRatingBar extends ConsumerWidget {
  const LRatingBar({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelpers = ref.watch(textStyleHelperProvider(context));
    final ratingCountAsync = ref.watch(starCountProvider(courseId));
    return ratingCountAsync.when(
      loading: RatingBarLoading.new,
      error: (_, __) => const SizedBox.shrink(),
      data: (ratingCount) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ratingCount.average.toStringAsFixed(1),
            style: textStyleHelpers.ratingValue,
          ),
          Gaps.w4,
          LRatingBarIndicator(rating: ratingCount.average),
          Gaps.w4,
          Text(
            '(${NumberFormat().format(ratingCount.total)})',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class LRatingBarIndicator extends StatelessWidget {
  const LRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 16,
      unratedColor: LColors.unratedColor,
      itemBuilder: (_, __) => const RatingItem(),
    );
  }
}

class RatingItem extends StatelessWidget {
  const RatingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const FaIcon(
      Icons.star,
      color: LColors.rating,
    );
  }
}
