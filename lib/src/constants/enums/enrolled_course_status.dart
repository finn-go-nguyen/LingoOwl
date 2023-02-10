enum EnrolledCourseStatus {
  /// not include archived courses
  all,
  favorited,
  archived;

  bool get isFavorited => this == EnrolledCourseStatus.favorited;
  bool get isAll => this == EnrolledCourseStatus.all;
  bool get isArchived => this == EnrolledCourseStatus.archived;
}
