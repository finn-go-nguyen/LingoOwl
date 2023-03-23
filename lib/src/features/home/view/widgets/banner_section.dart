import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../themes/styles.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          Assets.banners.banner2.path,
          fit: BoxFit.cover,
        ),
        Gaps.h12,
        Padding(
          padding: UiParameters.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  'Last day for these savings!',
                  maxLines: 1,
                  style: LStyles.ebGaramond(context)?.copyWith(
                    fontSize: 40,
                    height: 1.0,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
              Gaps.h12,
              Text(
                'Courses that meet today\'s challenges (and tomorrow\'s). '
                'They start at just \$9.9. Sale ends '
                '${DateFormat.MMMMd().format(DateTime.now().add(const Duration(days: 1)))}.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        )
      ],
    );
  }
}
