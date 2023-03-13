import 'package:flutter/material.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../model/section/section.dart';
import 'widgets/lecture_section.dart';

class LectureSelectionView extends StatefulWidget {
  const LectureSelectionView({
    super.key,
    required this.courseId,
    required this.sections,
    required this.selectedIndex,
  });

  final CourseId courseId;
  final List<LSection> sections;
  final Index selectedIndex;

  @override
  State<LectureSelectionView> createState() => _LectureSelectionViewState();
}

class _LectureSelectionViewState extends State<LectureSelectionView>
    with AutomaticKeepAliveClientMixin {
  late List<LSection> sortedSections;

  @override
  void initState() {
    super.initState();
    sortedSections = List.from(widget.sections)
      ..sort(
        (a, b) => a.index.compareTo(b.index),
      );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: sortedSections.length,
      itemBuilder: (context, index) {
        final section = sortedSections[index];
        return LectureSection(
          courseId: widget.courseId,
          section: section,
          selectedIndex: widget.selectedIndex,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
