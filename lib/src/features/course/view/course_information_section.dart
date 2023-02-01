import 'package:flutter/material.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../widgets/common/common.dart';

class CourseInformationSection extends StatelessWidget {
  const CourseInformationSection({
    super.key,
    required this.name,
    required this.description,
    required this.rating,
    required this.ratingCount,
    required this.instructorName,
  });

  final String name;
  final String description;
  final double rating;
  final int ratingCount;
  final String instructorName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        Gaps.h12,
        Text(description),
        Gaps.h12,
        RatingBar(
          rating: rating,
          ratingCount: ratingCount,
        ),
        Gaps.h12,
        Text('Created by $instructorName'),
        Gaps.h12,
        Row(
          children: const [
            Icon(
              Icons.update,
            ),
            Gaps.w8,
            Text('Last update 1/2023'),
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.public,
            ),
            Gaps.w8,
            Text('English'),
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.closed_caption,
            ),
            Gaps.w8,
            Text('English'),
          ],
        ),
      ],
    );
  }
}
