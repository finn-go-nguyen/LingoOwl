import 'package:flutter/material.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../router/coordinator.dart';
import '../../../widgets/common/common.dart';
import '../model/course.dart';

class CourseCardPortrait extends StatelessWidget {
  const CourseCardPortrait({
    super.key,
    required this.course,
  });

  final LCourse course;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => LCoordinator.showCourseDetails(course.id),
        child: Padding(
          padding: UiParameters.courseCardPadding,
          child: SizedBox(
            width: UiParameters.courseCardPortraitSize.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: LNetworkImage(
                    course.thumbnail,
                    radius: UiParameters.courseCardBorderRadius,
                  ),
                ),
                Gaps.h8,
                Text(
                  course.name,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Gaps.h8,
                Text(
                  course.instructorName,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gaps.h8,
                RatingBar(
                  rating: course.rating,
                  ratingCount: course.ratingCount,
                ),
                Gaps.h8,
                PriceLabel(
                  price: course.price,
                  salePrice: course.salePrice,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseCardLandscape extends StatelessWidget {
  const CourseCardLandscape({
    super.key,
    required this.course,
  });

  final LCourse course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          InkWell(
            onTap: () => LCoordinator.showCourseDetails(course.id),
            child: Padding(
              padding: UiParameters.courseCardPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox.square(
                    dimension: UiParameters.courseCardThumbnailDimension,
                    child: LNetworkImage(
                      course.thumbnail,
                      fit: BoxFit.cover,
                      radius: UiParameters.courseCardBorderRadius,
                    ),
                  ),
                  Gaps.w12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name,
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gaps.h4,
                        Text(
                          course.instructorName,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gaps.h4,
                        RatingBar(
                          rating: course.rating,
                          ratingCount: course.ratingCount,
                        ),
                        Gaps.h4,
                        PriceLabel(
                          price: course.price,
                          salePrice: course.salePrice,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
