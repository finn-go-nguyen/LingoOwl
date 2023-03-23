import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../widgets/common/non_video_viewport.dart';
import '../model/article.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({
    super.key,
    required this.article,
  });

  final LArticle article;

  @override
  Widget build(BuildContext context) {
    return NonVideoViewport(
      title: 'Article Name',
      child: SingleChildScrollView(
        child: Html(
          data: """
              <p>To help you get "in the action" a bit quicker, the installation guidance has been moved to the end of the course.&nbsp;</p><p><br></p><p><strong>If you DON'T&nbsp;have Linux installed yet:</strong></p><p>Head over now to the final section of the course (which is&nbsp;called&nbsp;"Appendix:&nbsp;Setting up your Linux Virtual Machine")&nbsp;and&nbsp;watch the installation videos which will take you step-by-step through the process of installing Linux inside a virtual machine.</p><p><br></p><p><strong>If you DO&nbsp;already have Linux Installed:</strong><br></p><p>You're all set so I&nbsp;hope you enjoy the course!</p><p>Do note, however, that if you are using a distribution of Linux other than Ubuntu, there are likely to be some compatibility issues between what you see on the videos and what happens on your computer. This is because different distributions of Linux all work slightly differently. </p><p>For maximal compatibility between what you see in the course and your experience, I highly recommend using Ubuntu, and follow the steps in the course's installation section.</p>
              <p>To help you get "in the action" a bit quicker, the installation guidance has been moved to the end of the course.&nbsp;</p><p><br></p><p><strong>If you DON'T&nbsp;have Linux installed yet:</strong></p><p>Head over now to the final section of the course (which is&nbsp;called&nbsp;"Appendix:&nbsp;Setting up your Linux Virtual Machine")&nbsp;and&nbsp;watch the installation videos which will take you step-by-step through the process of installing Linux inside a virtual machine.</p><p><br></p><p><strong>If you DO&nbsp;already have Linux Installed:</strong><br></p><p>You're all set so I&nbsp;hope you enjoy the course!</p><p>Do note, however, that if you are using a distribution of Linux other than Ubuntu, there are likely to be some compatibility issues between what you see on the videos and what happens on your computer. This is because different distributions of Linux all work slightly differently. </p><p>For maximal compatibility between what you see in the course and your experience, I highly recommend using Ubuntu, and follow the steps in the course's installation section.</p>""",
        ),
      ),
    );
  }
}
