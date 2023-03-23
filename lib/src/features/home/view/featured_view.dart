import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../course/model/course.dart';
import '../../enrolled_course/data/enrolled_course_repository.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constants/app_parameters/app_parameters.dart';
import '../../../utils/text_helpers.dart';
import '../../../widgets/common/common.dart';
import '../../../widgets/common/section_headline.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/course/course_card_loading.dart';
import '../../authentication/data/authentication_repository.dart';
import '../../course/data/course_repository.dart';
import '../../course/view/course_card.dart';
import '../../profile/data/user_repository.dart';
import 'widgets/banner_section.dart';

final unEnrolledCoursesProvider =
    FutureProvider.autoDispose<List<LCourse>>((ref) async {
  ref.keepAlive();
  final courses = await ref.watch(coursesProvider.future);
  final enrolledCourseIds = ref.watch(enrolledCourseIdsProvider);
  final update = List<LCourse>.from(courses)
    ..removeWhere((element) => enrolledCourseIds.contains(element.id));
  return update;
});

class FeaturedView extends ConsumerWidget {
  const FeaturedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseValue = ref.watch(unEnrolledCoursesProvider);
    return LScaffold(
      appBar: const LAppBarWithCartIconButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.h12,
            _buildHeader(),
            Gaps.h12,
            const BannerSection(),
            Gaps.h32,
            Padding(
              padding: UiParameters.screenPadding,
              child: Row(
                children: const [
                  SectionHeadline(text: 'Recommended for you'),
                  Spacer()
                ],
              ),
            ),
            Gaps.h12,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: UiParameters.screenPadding,
              child: SizedBox(
                height: UiParameters.courseCardPortraitSize.height +
                    UiParameters.courseCardPortraitPadding.top * 2,
                child: Builder(builder: (context) {
                  return courseValue.when(
                    error: (error, stackTrace) => const ErrorState(),
                    loading: () => Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                        10,
                        (index) => const CourseCardPortraitLoading(),
                      ),
                    ),
                    data: (data) {
                      final shuffle = List.from(data)..shuffle();
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          shuffle.length,
                          (index) => CourseCardPortrait(course: shuffle[index]),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            Gaps.h32,
            Padding(
              padding: UiParameters.screenPadding,
              child: Row(
                children: const [
                  SectionHeadline(text: 'Students are viewing'),
                  Spacer(),
                ],
              ),
            ),
            Gaps.h12,
            courseValue.when(
              loading: () => const CourseCardListLoading(axis: Axis.horizontal),
              error: (error, stackTrace) => const ErrorState(),
              data: (data) {
                final shuffle = List.from(data)..shuffle();
                return Padding(
                  padding: UiParameters.screenPadding,
                  child: Column(
                    children: shuffle
                        .map((e) => CourseCardLandscape(course: e))
                        .toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer(
      builder: (context, ref, child) {
        final uid = ref.watch(uidProvider);
        if (uid == null) return const SizedBox.shrink();
        final userValue = ref.watch(userFutureProvider(uid));
        final textHelpers = ref.watch(textHelpersProvider);
        return userValue.maybeWhen(
          orElse: SizedBox.shrink,
          data: (data) => Padding(
            padding: UiParameters.screenPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: 45.0,
                  child: ClipRRect(
                    borderRadius: UiParameters.circleBorderRadius,
                    child: data.photoUrl == null
                        ? Image.asset(Assets.icons.accountCircle.path)
                        : LNetworkImage(
                            data.photoUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Gaps.w12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome, ${textHelpers.toDisplayName(
                          firstName: data.firstName,
                          lastName: data.lastName,
                        )}',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Advancing Mobile Application Developer',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
