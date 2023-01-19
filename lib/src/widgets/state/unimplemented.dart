import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/app_sizes.dart';

class Unimplemented extends StatelessWidget {
  const Unimplemented({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 300.0,
              child: Lottie.asset(Assets.lotties.maintenance),
            ),
            Gaps.h32,
            Text(
              'Unimplemented feature',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
