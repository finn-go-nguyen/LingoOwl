import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/review.dart';

part 'reviews_state.freezed.dart';

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState({
    @Default(<LReview>[]) List<LReview> reviews,
    @Default(AsyncLoading()) AsyncValue<void> status,
    @Default(false) bool noMoreItem,
  }) = _ReviewsState;
}
