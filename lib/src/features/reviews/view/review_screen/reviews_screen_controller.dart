import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../application/review_service.dart';
import 'reviews_state.dart';

final reviewsControllerProvider = StateNotifierProvider.autoDispose
    .family<ReviewsController, ReviewsState, CourseId>((ref, courseId) {
  final reviewService = ref.watch(reviewServiceProvider);
  return ReviewsController(reviewService, courseId);
});

class ReviewsController extends StateNotifier<ReviewsState> {
  ReviewsController(
    this._reviewService,
    this._courseId,
  ) : super(const ReviewsState()) {
    _fetchFirstBatch();
  }

  final ReviewService _reviewService;
  final CourseId _courseId;

  void _fetchFirstBatch() async {
    final reviewsAsync = await AsyncValue.guard(
        () => _reviewService.fetchReviews(_courseId, limit: 10));
    if (!reviewsAsync.hasValue) {
      state = state.copyWith(status: reviewsAsync);
      return;
    }

    final reviews = reviewsAsync.maybeMap(
      data: (data) => data.value,
      orElse: () => null,
    );

    if (reviews == null) return;

    state = state.copyWith(
      reviews: reviews,
      status: const AsyncData(null),
    );
  }

  void fetchNextBatch() async {
    if (state.noMoreItem) return;

    state = state.copyWith(status: const AsyncLoading());

    final reviewsAsync = await AsyncValue.guard(
      () => _reviewService.fetchReviews(
        _courseId,
        reviewId: state.reviews.last.id,
      ),
    );

    state = state.copyWith(status: reviewsAsync);

    final reviews = reviewsAsync.maybeMap(
      data: (data) => data.value,
      orElse: () => null,
    );

    if (reviews == null) return;

    state = state.copyWith(
      reviews: [...state.reviews, ...reviews],
      status: const AsyncData(null),
      noMoreItem: reviews.isEmpty,
    );
  }
}
