import 'package:flutter/material.dart';

import '../../router/app_router.dart';

class LectureMoreItem {
  const LectureMoreItem._(
    this.label,
    this.iconData,
    this.route,
  );

  final String label;
  final IconData iconData;
  final LRoutes route;

  static const items = <LectureMoreItem>[
    LectureMoreItem._(
      'Share this Course',
      Icons.share,
      LRoutes.unimplemented,
    ),
    LectureMoreItem._(
      'Q&A',
      Icons.chat_bubble_outline,
      LRoutes.unimplemented,
    ),
    LectureMoreItem._(
      'Notes',
      Icons.note_alt_outlined,
      LRoutes.notes,
    ),
    LectureMoreItem._(
      'Add course to favorites',
      Icons.favorite_outline,
      LRoutes.unimplemented,
    ),
    LectureMoreItem._(
      'Archive this Course',
      Icons.archive_outlined,
      LRoutes.unimplemented,
    ),
  ];
}
