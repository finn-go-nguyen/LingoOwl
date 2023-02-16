import 'package:flutter/material.dart';

class LectureMoreItem {
  const LectureMoreItem._(this.label, this.iconData);

  final String label;
  final IconData iconData;

  static const items = <LectureMoreItem>[
    LectureMoreItem._('Share this Course', Icons.share),
    LectureMoreItem._('Q&A', Icons.chat_bubble_outline),
    LectureMoreItem._('Notes', Icons.note_alt_outlined),
    LectureMoreItem._('Add course to favorites', Icons.favorite_outline),
    LectureMoreItem._('Archive this Course', Icons.archive_outlined),
  ];
}
