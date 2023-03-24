import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../router/coordinator.dart';
import '../../../../widgets/common/common.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../../course/data/course_repository.dart';

class CartItemCard extends ConsumerWidget {
  const CartItemCard({
    super.key,
    required this.courseId,
    required this.onDeleted,
  });

  final CourseId courseId;
  final void Function(String courseId)? onDeleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseAsync = ref.watch(courseProvider(courseId));
    return courseAsync.when(
      loading: () => const LoadingState(),
      error: (_, __) => const SizedBox.shrink(),
      data: (course) => InkWell(
        onTap: () => LCoordinator.showCourseDetailsScreen(courseId),
        child: Padding(
          padding: UiParameters.cartItemCardContentPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LNetworkImage(
                course.thumbnail,
                dimension: UiParameters.courseCardThumbnailDimension,
                fit: BoxFit.cover,
              ),
              Gaps.w12,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gaps.h8,
                    Text(
                      course.instructorName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        // TextButton(
                        //   style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        //   onPressed: () {},
                        //   child: const Text('Save for later'),
                        // ),
                        // Gaps.w8,
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            showAlertDialog(
                              context: context,
                              title: 'Remove course from your cart?',
                              cancelActionText: 'Cancel',
                              onConfirmPressed: () => onDeleted?.call(courseId),
                            );
                          },
                          child: const Text('Remove'),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
