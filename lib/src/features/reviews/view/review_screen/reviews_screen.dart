import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/ui_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/common.dart';
import '../../../../widgets/state/error.dart';
import '../../../rating_count/view/review_star_count_section.dart';
import 'reviews_screen_controller.dart';
import 'widgets/review_list_view.dart';

class ReviewsScreen extends ConsumerStatefulWidget {
  const ReviewsScreen({
    super.key,
    required this.courseId,
    required this.courseName,
  });

  final CourseId courseId;
  final String courseName;

  @override
  ConsumerState<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends ConsumerState<ReviewsScreen> {
  late final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final loadMoreOffset = _controller.position.maxScrollExtent - 200;
      final currentPosition = _controller.position.pixels;
      if (currentPosition < loadMoreOffset) return;

      EasyThrottle.throttle(
          'fetch-more-reviews',
          const Duration(milliseconds: 500),
          ref
              .read(reviewsControllerProvider(widget.courseId).notifier)
              .fetchNextBatch);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: LAppBar(title: Text(widget.courseName)),
      body: SingleChildScrollView(
        controller: _controller,
        padding: UiParameters.screenPadding,
        child: Column(
          children: [
            ReviewStarCountSection(
              courseId: widget.courseId,
            ),
            Consumer(
              builder: (context, ref, child) {
                ref.listen<AsyncValue<void>>(
                    reviewsControllerProvider(widget.courseId)
                        .select((state) => state.status), (_, next) {
                  next.showError(context);
                });

                final state =
                    ref.watch(reviewsControllerProvider(widget.courseId));
                return state.status.when(
                  data: (_) => ReviewListView(
                    reviews: state.reviews,
                  ),
                  error: (error, stackTrace) => const ErrorState(),
                  loading: () => ReviewListView(
                    reviews: state.reviews,
                    isLoading: true,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
