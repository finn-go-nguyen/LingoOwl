import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class LReview with _$LReview {
  const LReview._();
  const factory LReview({
    required ReviewId id,
    required UserId userId,
    required CourseId courseId,
    required int rating,
    required TimeStamp timeStamp,
    required String content,
  }) = _LReview;

  factory LReview.fromJson(Map<String, Object?> json) =>
      _$LReviewFromJson(json);
}
