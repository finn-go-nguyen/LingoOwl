import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../router/coordinator.dart';
import '../../../../widgets/common/common.dart';
import '../../../../widgets/state/empty/wishlist_empty.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../../course/data/course_repository.dart';
import '../../data/wishlist_repository.dart';

class WishlistListView extends ConsumerWidget {
  const WishlistListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistAsync = ref.watch(wishlistProvider);
    return wishlistAsync.when(
      loading: () => const LoadingState(),
      error: (error, stackTrace) => const ErrorState(),
      data: (wishlist) {
        return wishlist.courses.isEmpty
            ? const WishlistEmpty()
            : ListView.builder(
                itemCount: wishlist.courses.length,
                itemBuilder: (context, index) => WishlistItem(
                  id: wishlist.courses.keys.elementAt(index),
                ),
              );
      },
    );
  }
}

class WishlistItem extends ConsumerWidget {
  const WishlistItem({
    super.key,
    required this.id,
  });

  final CourseId id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseValue = ref.watch(courseProvider(id));
    return courseValue.when(
      loading: () => const LoadingState(),
      error: (error, stackTrace) => const ErrorState(),
      data: (course) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            InkWell(
              onTap: () => LCoordinator.showCourseDetailsScreen(course.id),
              child: Padding(
                padding: UiParameters.courseCardPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LNetworkImage(
                      course.thumbnail,
                      dimension: UiParameters.courseCardThumbnailDimension,
                      fit: BoxFit.cover,
                      borderRadius: UiParameters.courseCardBorderRadius,
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
      ),
    );
  }
}
