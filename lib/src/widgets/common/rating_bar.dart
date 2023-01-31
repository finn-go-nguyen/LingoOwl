import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../constants/app_parameters/app_parameters.dart';
import '../../themes/colors.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  final double rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(rating.toStringAsFixed(1),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: LColors.rating)),
        Gaps.w4,
        RatingBarIndicator(
          rating: rating,
          itemSize: 20,
          unratedColor: LColors.unratedColor,
          itemBuilder: (context, _) => const FaIcon(
            Icons.star,
            color: LColors.rating,
          ),
        ),
        Gaps.w4,
        Text(
          '(${NumberFormat().format(ratingCount)})',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
