import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/type_defs/type_defs.dart';

part 'leave_review_state.freezed.dart';

@freezed
class LeaveReviewState with _$LeaveReviewState {
  const LeaveReviewState._();
  const factory LeaveReviewState({
    @Default(0) int rating,
    @Default(AsyncData(null)) AsyncValue<void> status,
    ReviewId? reviewId,
  }) = _LeaveReviewState;

  bool get canSubmit => rating != 0 && !status.hasError;
}
