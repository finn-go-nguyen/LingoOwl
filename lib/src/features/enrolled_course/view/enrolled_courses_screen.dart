import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_constants/tab_items.dart';
import '../../../constants/enums/enrolled_course_status.dart';
import '../../../widgets/common/common.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/loading.dart';
import '../../cart/view/cart_icon/cart_icon.dart';
import '../data/enrolled_course_repository.dart';
import '../model/enrolled_course.dart';
import 'enrolled_course_list_view.dart';

class EnrolledCoursesScreen extends StatelessWidget {
  const EnrolledCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: const LAppBar(
        title: 'My courses',
        actions: [
          // TODO: Add search icon button
          CartIcon(),
        ],
      ),
      body: DefaultTabController(
        length: TabItems.myCourses.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: List.generate(
                TabItems.myCourses.length,
                (index) => TabItems.myCourses[index],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      final enrolledCoursesAsync =
                          ref.watch(enrolledCoursesProvider);
                      return enrolledCoursesAsync.when(
                        loading: LoadingState.new,
                        error: (error, stackTrace) => ErrorState(
                          message: error.runtimeType.toString(),
                        ),
                        data: (enrolledCourses) => EnrolledCourseListView(
                          courses: enrolledCourses,
                        ),
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return const EnrolledCourseListView(
                        courses: <EnrolledCourse>[],
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final enrolledCoursesAsync = ref.watch(
                        enrolledCoursesByStatusProvider(
                          EnrolledCourseStatus.favorited,
                        ),
                      );
                      return enrolledCoursesAsync.when(
                        loading: LoadingState.new,
                        error: (error, stackTrace) => ErrorState(
                          message: error.runtimeType.toString(),
                        ),
                        data: (enrolledCourses) => EnrolledCourseListView(
                          courses: enrolledCourses,
                        ),
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final enrolledCoursesAsync = ref.watch(
                        enrolledCoursesByStatusProvider(
                          EnrolledCourseStatus.archived,
                        ),
                      );
                      return enrolledCoursesAsync.when(
                        loading: LoadingState.new,
                        error: (error, stackTrace) => ErrorState(
                          message: error.runtimeType.toString(),
                        ),
                        data: (enrolledCourses) => EnrolledCourseListView(
                          courses: enrolledCourses,
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
