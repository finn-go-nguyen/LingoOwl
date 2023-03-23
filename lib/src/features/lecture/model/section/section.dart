import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../lecture/lecture.dart';

part 'section.freezed.dart';
part 'section.g.dart';

@freezed
class LSection with _$LSection {
  const LSection._();
  const factory LSection({
    required Index index,
    required String name,
    required List<LLecture> lectures,
  }) = _LSection;

  factory LSection.fromJson(Map<String, Object?> json) =>
      _$LSectionFromJson(json);

  bool hasLecture(Index lectureIndex) {
    try {
      lectures.firstWhere((element) => element.index == lectureIndex);
      return true;
    } on StateError {
      return false;
    }
  }

  List<LLecture> get sortedLectures => List.from(lectures)
    ..sort(
      (a, b) => a.index.compareTo(b.index),
    );
}
