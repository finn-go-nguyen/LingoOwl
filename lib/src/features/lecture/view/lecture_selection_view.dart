import 'package:flutter/material.dart';

import 'lecture_section/lecture_section.dart';

class LectureSelectionView extends StatefulWidget {
  const LectureSelectionView({super.key});

  @override
  State<LectureSelectionView> createState() => _LectureSelectionViewState();
}

class _LectureSelectionViewState extends State<LectureSelectionView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        return const LectureSection();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
