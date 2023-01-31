import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../themes/colors.dart';
import '../../../common/common.dart';

class RatingBarLoading extends StatelessWidget {
  const RatingBarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ColoredSizedBox(
          height: 20,
          width: 30,
        ),
        Gaps.w4,
        RatingBarIndicator(
          itemSize: 20,
          unratedColor: LColors.unratedColor,
          itemBuilder: (context, _) => const FaIcon(Icons.star),
        ),
        Gaps.w4,
        const Flexible(
          child: ColoredSizedBox(
            height: 20,
            width: 80,
          ),
        ),
      ],
    );
  }
}
