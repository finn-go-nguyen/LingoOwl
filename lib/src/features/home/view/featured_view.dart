import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/common/scaffold.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/course/course_card_loading.dart';
import '../../course/data/course_repository.dart';
import '../../course/view/course_card.dart';

class FeaturedView extends ConsumerWidget {
  const FeaturedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseValue = ref.watch(coursesProvider);
    return LScaffold(
      body: Column(
        children: [
          courseValue.when(
            loading: () => const CourseCardListLoading(axis: Axis.horizontal),
            error: (error, stackTrace) => const ErrorState(),
            data: (data) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  data.length,
                  (index) => CourseCardPortrait(course: data[index]),
                ),
              ),
            ),
          ),
          Expanded(
            child: courseValue.when(
              loading: () => const CourseCardListLoading(axis: Axis.vertical),
              error: (error, stackTrace) => const ErrorState(),
              data: (data) => SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    data.length,
                    (index) => CourseCardLandscape(course: data[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
