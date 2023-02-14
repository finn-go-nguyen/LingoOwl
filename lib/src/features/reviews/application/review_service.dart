import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../authentication/data/authentication_repository.dart';
import '../data/review_repository.dart';
import '../model/review/review.dart';

final reviewServiceProvider = Provider<ReviewService>((ref) {
  final authRepository =
      ref.watch(DomainManager.instance.authRepositoryProvider);
  final reviewRepository =
      ref.watch(DomainManager.instance.reviewRepositoryProvider);
  return ReviewService(
    authRepository,
    reviewRepository,
  );
});

final reviewsProvider = FutureProvider.autoDispose
    .family<List<LReview>, CourseId>((ref, courseId) async {
  final reviewService = ref.watch(reviewServiceProvider);
  return reviewService.fetchReviews(courseId, limit: 5);
});

final reviewProvider = FutureProvider.autoDispose
    .family<LReview?, CourseId>((ref, courseId) async {
  final reviewService = ref.watch(reviewServiceProvider);
  return reviewService.fetchReview(courseId);
});

class ReviewService {
  ReviewService(
    this._authenticationRepository,
    this._reviewRepository,
  );

  final AuthenticationRepository _authenticationRepository;
  final ReviewRepository _reviewRepository;

  Future<void> addReview({
    required ReviewId? reviewId,
    required CourseId courseId,
    required int rating,
    required String content,
  }) async {
    try {
      final user = _authenticationRepository.currentUser;
      if (user == null) return;
      final review = LReview(
        id: reviewId ?? const Uuid().v4(),
        userId: user.id,
        courseId: courseId,
        rating: rating,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        content: content,
      );
      return _reviewRepository.addReview(review);
    } catch (e) {
      rethrow;
    }
  }

  Future<LReview?> fetchReview(CourseId courseId) async {
    try {
      final user = _authenticationRepository.currentUser;
      if (user == null) return null;

      return _reviewRepository.fetchReview(courseId, user.id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LReview>> fetchReviews(CourseId courseId,
      {int limit = 5, ReviewId? reviewId}) async {
    try {
      return _reviewRepository.fetchReviews(
        courseId,
        limit: limit,
        reviewId: reviewId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
