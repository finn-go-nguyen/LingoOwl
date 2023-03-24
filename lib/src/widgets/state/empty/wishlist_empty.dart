import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constants/app_parameters/app_parameters.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox.square(
                  dimension: UiParameters.lottiesDimension,
                  child: LottieBuilder.asset(
                    Assets.lotties.empty,
                    repeat: false,
                  ),
                ),
                const Text(
                  'Want to save something for later?',
                  textAlign: TextAlign.center,
                ),
                Gaps.h12,
                const Text(
                  'Your wishlist will go here.',
                  textAlign: TextAlign.center,
                ),
                // Gaps.h64,
                // const BrowseCategories(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
