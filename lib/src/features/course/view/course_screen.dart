import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../widgets/common/common.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/loading.dart';
import '../../cart/view/add_to_cart/add_to_cart_button.dart';
import '../../cart/view/cart_icon/cart_icon.dart';
import '../data/course_repository.dart';
import 'course_information_section.dart';
import 'course_what_you_will_learn_section.dart';

class CourseScreen extends ConsumerWidget {
  const CourseScreen({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseValue = ref.watch(courseProvider(courseId));
    return LScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
              const CartIcon()
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                courseValue.when(
                  loading: () => const LoadingState(),
                  error: (_, __) => const ErrorState(),
                  data: (course) => Padding(
                    padding: UiParameters.screenPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.h12,
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: UiParameters.thumbnailBorderRadius,
                            child: LNetworkImage(
                              course.thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Gaps.h12,
                        CourseInformationSection(
                          name: course.name,
                          description: course.description,
                          rating: course.rating,
                          ratingCount: course.ratingCount,
                          instructorName: course.instructorName,
                        ),
                        PriceLabel(
                          price: course.price,
                          salePrice: course.salePrice,
                        ),
                        Gaps.h16,
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {},
                            child: const Text('Buy now'),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AddToCartButton(
                                courseId: courseId,
                              ),
                            ),
                            Gaps.w8,
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Add to wishlist'),
                              ),
                            )
                          ],
                        ),
                        Gaps.h12,
                        WhatYouWillLearn(
                          contents: course.youWillLearn,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
