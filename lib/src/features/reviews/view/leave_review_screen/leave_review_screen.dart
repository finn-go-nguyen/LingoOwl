import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../router/coordinator.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../widgets/common/common.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../application/review_service.dart';
import '../../model/review.dart';
import 'course_rating_bar.dart';
import 'leave_review_screen_controller.dart';

class LeaveReviewScreen extends StatelessWidget {
  const LeaveReviewScreen({super.key, required this.courseId});

  final CourseId courseId;

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: const LAppBar(
        title: Text('Leave a review'),
      ),
      body: Padding(
        padding: UiParameters.screenPadding,
        child: Consumer(builder: (context, ref, child) {
          final reviewAsync = ref.watch(reviewProvider(courseId));

          return reviewAsync.when(
            data: (review) =>
                LeaveReviewForm(courseId: courseId, review: review),
            error: (error, stackTrace) => ErrorState(
              message: error.runtimeType.toString(),
            ),
            loading: () => const LoadingState(),
          );
        }),
      ),
    );
  }
}

class LeaveReviewForm extends ConsumerStatefulWidget {
  const LeaveReviewForm({
    super.key,
    required this.courseId,
    required this.review,
  });
  final CourseId courseId;
  final LReview? review;

  @override
  ConsumerState<LeaveReviewForm> createState() => _LeaveReviewFormState();
}

class _LeaveReviewFormState extends ConsumerState<LeaveReviewForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.review != null) {
      _controller.text = widget.review!.content;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
        leaveReviewControllerProvider(widget.courseId)
            .select((state) => state.status), (previous, next) {
      next.showError(context);
      next.showSuccess(context, content: 'Your review has been submitted!');
    });

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.review != null) ...[
            Text('You reviewed this course before. Submit again to edit.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium),
            Gaps.h24,
          ],
          Center(
            child: Consumer(
              builder: (context, ref, child) {
                final rating = ref.watch(
                    leaveReviewControllerProvider(widget.courseId)
                        .select((state) => state.rating));
                return CourseRatingBar(
                  initialRating: rating,
                  onRatingUpdate: ref
                      .read(leaveReviewControllerProvider(widget.courseId)
                          .notifier)
                      .onRatingUpdate,
                );
              },
            ),
          ),
          Gaps.h32,
          TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Your review (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          Gaps.h32,
          Consumer(
            builder: (context, ref, child) {
              final canSubmit = ref.watch(
                  leaveReviewControllerProvider(widget.courseId)
                      .select((state) => state.canSubmit));
              final status = ref.watch(
                  leaveReviewControllerProvider(widget.courseId)
                      .select((state) => state.status));
              return SubmitButton(
                onSubmitted: canSubmit
                    ? () => ref
                        .read(leaveReviewControllerProvider(widget.courseId)
                            .notifier)
                        .onSubmitted(widget.courseId, _controller.text,
                            onSubmitSuccessfully: LCoordinator.onBack)
                    : null,
                isLoading: status.isLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
