import 'package:flutter/material.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../animation/shimmer.dart';
import '../../../common/common.dart';
import '../rating/rating_bar_loading.dart';
import 'price_label_loading.dart';

class CourseCardPortraitLoading extends StatelessWidget {
  const CourseCardPortraitLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: SizedBox(
        width: UiParameters.courseCardPortraitSize.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: UiParameters.courseCardBorderRadius,
                child: ColoredSizedBox(
                  width: UiParameters.courseCardPortraitSize.width,
                ),
              ),
            ),
            Gaps.h8,
            const ColoredSizedBox(
              height: 20.0,
              width: double.infinity,
            ),
            Gaps.h4,
            const ColoredSizedBox(
              height: 20.0,
              width: double.infinity,
            ),
            Gaps.h4,
            ColoredSizedBox(
              height: 20.0,
              width: UiParameters.courseCardPortraitSize.width * .5,
            ),
            Gaps.h8,
            ColoredSizedBox(
              height: 14.0,
              width: UiParameters.courseCardPortraitSize.width * .7,
            ),
            Gaps.h12,
            const RatingBarLoading(),
            Gaps.h12,
            const PriceLabelLoading(),
          ],
        ),
      ),
    );
  }
}

class CourseCardLandscapeLoading extends StatelessWidget {
  const CourseCardLandscapeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: UiParameters.courseCardLandscapePadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ColoredSizedBox(
                  height: UiParameters.courseCardThumbnailDimension,
                  width: UiParameters.courseCardThumbnailDimension,
                  borderRadius: UiParameters.courseCardBorderRadius,
                ),
                Gaps.w12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ColoredSizedBox(
                        height: 20.0,
                        width: double.infinity,
                      ),
                      Gaps.h4,
                      ColoredSizedBox(
                        height: 20.0,
                        width: 250,
                      ),
                      Gaps.h8,
                      RatingBarLoading(),
                      Gaps.h8,
                      PriceLabelLoading(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class CourseCardListLoading extends StatelessWidget {
  const CourseCardListLoading({
    super.key,
    required this.axis,
  });

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    const itemCount = 5;
    return Shimmer(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: axis,
          child: axis == Axis.horizontal
              ? Row(
                  children: List.generate(
                    itemCount,
                    (index) => const CourseCardPortraitLoading(),
                  ),
                )
              : Column(
                  children: List.generate(
                    itemCount,
                    (index) => const CourseCardLandscapeLoading(),
                  ),
                ),
        ),
      ),
    );
  }
}
