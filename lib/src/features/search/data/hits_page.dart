import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';

import '../../course/model/course.dart';

class HitsPage {
  const HitsPage(
    this.courses,
    this.pageKey,
    this.nextPageKey,
  );

  final List<LCourse> courses;
  final int pageKey;
  final int? nextPageKey;

  factory HitsPage.fromResponse(SearchResponse response) {
    final items = response.hits
        .map(
          (e) => LCourse.fromJson(e.cast<String, dynamic>()),
        )
        .toList();
    final isLastPage = response.page >= response.nbPages - 1;
    final nextPageKey = isLastPage ? null : response.page + 1;
    return HitsPage(items, response.page, nextPageKey);
  }
}
