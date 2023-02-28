import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../application/review_service.dart';
import 'leave_review_state.dart';

final leaveReviewControllerProvider = StateNotifierProvider.autoDispose
    .family<LeaveReviewController, LeaveReviewState, CourseId>((ref, courseId) {
  final reviewService = ref.watch(reviewServiceProvider);
  return LeaveReviewController(reviewService, courseId);
});

class LeaveReviewController extends StateNotifier<LeaveReviewState> {
  LeaveReviewController(
    this._reviewService,
    this.courseId,
  ) : super(const LeaveReviewState()) {
    _fetchReview();
  }

  final ReviewService _reviewService;
  final CourseId courseId;

  void onRatingUpdate(int rating) {
    state = state.copyWith(rating: rating);
  }

  void _fetchReview() async {
    final reviewAsync =
        await AsyncValue.guard(() => _reviewService.fetchReview(courseId));
    if (!reviewAsync.hasValue) return;

    final review = reviewAsync.maybeMap(
      data: (data) => data.value,
      orElse: () => null,
    );

    if (review == null) return;
    state = state.copyWith(rating: review.rating, reviewId: review.id);
  }

  void onSubmitted(CourseId courseId, String content,
      {required VoidCallback? onSubmitSuccessfully}) async {
    state = state.copyWith(status: const AsyncLoading());
    final asyncValue = await AsyncValue.guard(
      () => _reviewService.addReview(
        reviewId: state.reviewId,
        courseId: courseId,
        rating: state.rating,
        content: content,
      ),
    );
    if (!asyncValue.hasError) {
      onSubmitSuccessfully?.call();
    }

    state = state.copyWith(status: asyncValue);
  }
}
