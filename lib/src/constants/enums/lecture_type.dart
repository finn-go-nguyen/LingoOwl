enum LectureType {
  video,
  article,
  quiz;

  bool get isVideo => this == LectureType.video;
  bool get isArticle => this == LectureType.article;
  bool get isQuiz => this == LectureType.quiz;
}
