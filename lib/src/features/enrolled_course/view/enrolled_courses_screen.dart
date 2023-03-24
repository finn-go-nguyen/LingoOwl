import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_constants/tab_items.dart';
import '../../../widgets/common/common.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/loading.dart';
import '../../cart/view/cart_icon_button/cart_icon_button.dart';
import '../data/enrolled_course_repository.dart';
import 'enrolled_course_list_view.dart';

class EnrolledCoursesScreen extends StatelessWidget {
  const EnrolledCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: const LAppBar(
        title: Text('My courses'),
        actions: [
          // TODO: Add search icon button
          CartIconButton(),
        ],
      ),
      body: DefaultTabController(
        length: TabItems.myCourses.length,
        child: Column(
          children: [
            Expanded(
              child: Consumer(
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
            )
          ],
        ),
      ),
    );
  }
}
