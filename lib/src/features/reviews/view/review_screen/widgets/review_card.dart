import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_parameters/app_parameters.dart';
import '../../../../../utils/formatter.dart';
import '../../../../../utils/text_helpers.dart';
import '../../../../../utils/text_style_helper.dart';
import '../../../../../widgets/common/common.dart';
import '../../../../profile/data/user_repository.dart';
import '../../../model/review/review.dart';

class ReviewCard extends ConsumerWidget {
  const ReviewCard({
    super.key,
    required this.review,
  });

  final LReview review;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelper = ref.watch(textStyleHelperProvider(context));
    final dateFormatter = ref.watch(dateTimeFormatterProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final user = ref.watch(userFutureProvider(review.userId));
            return user.maybeWhen(
              data: (user) => Text(
                TextHelpers.toDisplayName(
                  firstName: user.firstName,
                  lastName: user.lastName,
                ),
                style: textStyleHelper.reviewerName,
              ),
              orElse: () => const Text('Anonymous'),
            );
          },
        ),
        Row(
          children: [
            LRatingBarIndicator(rating: review.rating.toDouble()),
            Gaps.w8,
            Text(
              dateFormatter.format(
                DateTime.fromMillisecondsSinceEpoch(review.timeStamp),
              ),
            )
          ],
        ),
        if (review.content.isNotEmpty) ...{
          Text(
            review.content,
            textAlign: TextAlign.justify,
          )
        }
      ],
    );
  }
}
