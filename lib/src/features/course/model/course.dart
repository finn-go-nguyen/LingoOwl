import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class LCourse with _$LCourse {
  const LCourse._();

  const factory LCourse({
    required String id,
    required String name,
    required String description,
    required String thumbnail,
    required String instructorName,
    required double price,
    double? salePrice,
    required String category,
    required List<String> youWillLearn,
  }) = _LCourse;

  factory LCourse.fromJson(Map<String, Object?> json) =>
      _$LCourseFromJson(json);
}
