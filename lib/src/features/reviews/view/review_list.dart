import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/app_parameters/app_parameters.dart';
import '../../../utils/formatter.dart';
import '../../../utils/text_style_helper.dart';
import '../../../widgets/common/rating_bar.dart';

import '../model/review/review.dart';

final _reviews = <LReview>[
  LReview(
    reviewId: '1',
    courseId: '1',
    reviewerName: 'Abdul Moiz S.',
    star: 4,
    timeStamp: DateTime.now().millisecondsSinceEpoch,
    content:
        'Brilliant content and exceptionally well delivered! Will recommend this course to any interested in backend engineering whether they are starting off their career or have years of experience.',
  ),
  LReview(
    reviewId: '1',
    courseId: '1',
    reviewerName: 'Abdul Moiz S.',
    star: 2,
    timeStamp: DateTime.now().millisecondsSinceEpoch,
    content:
        'Brilliant content and exceptionally well delivered! Will recommend this course to any interested in backend engineering whether they are starting off their career or have years of experience.',
  ),
  LReview(
    reviewId: '1',
    courseId: '1',
    reviewerName: 'Abdul Moiz S.',
    star: 5,
    timeStamp: DateTime.now().millisecondsSinceEpoch,
    content:
        'Brilliant content and exceptionally well delivered! Will recommend this course to any interested in backend engineering whether they are starting off their career or have years of experience.',
  ),
  LReview(
    reviewId: '1',
    courseId: '1',
    reviewerName: 'Abdul Moiz S.',
    star: 1,
    timeStamp: DateTime.now().millisecondsSinceEpoch,
    content:
        'Brilliant content and exceptionally well delivered! Will recommend this course to any interested in backend engineering whether they are starting off their career or have years of experience.',
  ),
];

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Get from repository
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: _reviews.length,
      itemBuilder: (context, index) => Padding(
        padding: UiParameters.reviewCardPadding,
        child: ReviewCard(review: _reviews[index]),
      ),
    );
  }
}

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
        Text(
          review.reviewerName,
          style: textStyleHelper.reviewerName,
        ),
        Row(
          children: [
            LRatingBarIndicator(rating: review.star.toDouble()),
            Gaps.w8,
            Text(
              dateFormatter.format(
                DateTime.fromMillisecondsSinceEpoch(review.timeStamp),
              ),
            )
          ],
        ),
        Text(
          review.content,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
