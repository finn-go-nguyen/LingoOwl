enum LectureType {
  video,
  article;

  bool get isVideo => this == LectureType.video;
  bool get isArticle => this == LectureType.article;
}
