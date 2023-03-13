import '../constants/type_defs/type_defs.dart';

class LectureNameProviderParams {
  const LectureNameProviderParams(
      this.courseId, this.sectionIndex, this.lectureIndex);

  final CourseId courseId;
  final Index sectionIndex;
  final Index lectureIndex;
}
