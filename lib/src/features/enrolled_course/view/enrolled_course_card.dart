import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../course_progress/view/course_progress_bar.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../router/coordinator.dart';
import '../../../utils/text_style_helper.dart';
import '../../../widgets/common/common.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/loading.dart';
import '../../course/data/course_repository.dart';

class EnrolledCourseCard extends ConsumerWidget {
  const EnrolledCourseCard({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelper = ref.watch(textStyleHelperProvider(context));
    final courseAsync = ref.watch(courseProvider(courseId));
    return courseAsync.when(
      loading: LoadingState.new,
      error: (error, _) => ErrorState(message: error.runtimeType.toString()),
      data: (course) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            InkWell(
              onTap: () => LCoordinator.showLectureScreen(course.id),
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
                            style: textStyleHelper.courseNameMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Gaps.h4,
                          InstructionNameLabel(
                            name: course.instructorName,
                          ),
                          Gaps.h8,
                          CourseProgressBar(courseId: courseId),
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
