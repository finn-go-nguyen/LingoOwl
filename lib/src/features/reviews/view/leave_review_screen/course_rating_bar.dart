import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../widgets/common/rating_bar.dart';

class CourseRatingBar extends StatelessWidget {
  const CourseRatingBar({
    super.key,
    this.initialRating = 0,
    required this.onRatingUpdate,
  });

  final int initialRating;
  final ValueChanged<int> onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating.toDouble(),
      minRating: 1,
      glow: false,
      itemBuilder: (_, __) => const RatingItem(),
      onRatingUpdate: (value) => onRatingUpdate(value.toInt()),
    );
  }
}
