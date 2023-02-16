import 'package:flutter/material.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../model/lecture/lecture.dart';
import '../model/section/section.dart';
import 'widgets/lecture_section.dart';

class LectureSelectionView extends StatefulWidget {
  const LectureSelectionView({
    super.key,
    required this.sections,
    required this.lectures,
    required this.selectedIndex,
    required this.courseId,
  });

  final CourseId courseId;
  final List<LSection> sections;
  final List<LLecture> lectures;
  final Index selectedIndex;

  @override
  State<LectureSelectionView> createState() => _LectureSelectionViewState();
}

class _LectureSelectionViewState extends State<LectureSelectionView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: widget.sections.length,
      itemBuilder: (context, index) {
        final section = widget.sections[index];
        final sectionLectures = widget.lectures
            .where(
              (element) => element.sectionIndex == section.index,
            )
            .toList();
        return LectureSection(
          courseId: widget.courseId,
          section: section,
          sectionLectures: sectionLectures,
          selectedIndex: widget.selectedIndex,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
