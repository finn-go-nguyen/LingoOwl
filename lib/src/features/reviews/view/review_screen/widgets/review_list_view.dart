import 'package:flutter/material.dart';

import '../../../../../constants/app_parameters/app_parameters.dart';
import '../../../../../widgets/state/loading/loading.dart';
import '../../../model/review/review.dart';
import 'review_card.dart';

class ReviewListView extends StatelessWidget {
  const ReviewListView({
    super.key,
    required this.reviews,
    this.isLoading = false,
  });

  final List<LReview> reviews;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        ...List.generate(
          reviews.length,
          (index) => Padding(
            padding: UiParameters.reviewCardPadding,
            child: ReviewCard(review: reviews[index]),
          ),
        ),
        if (isLoading) const LoadingState.small(),
        Gaps.h64,
      ],
    );
  }
}

class FixedReviewListView extends StatelessWidget {
  const FixedReviewListView({
    super.key,
    required this.reviews,
  });

  final List<LReview> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        reviews.length,
        (index) => ReviewCard(
          review: reviews[index],
        ),
      ),
    );
  }
}
