import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/colors.dart';

class LNetworkImage extends StatelessWidget {
  const LNetworkImage(
    this.url, {
    super.key,
    this.fit = BoxFit.contain,
    this.borderRadius = const BorderRadius.all(Radius.circular(6.0)),
    this.dimension,
  });

  final String url;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: fit,
          progressIndicatorBuilder: (_, __, ___) => Shimmer(
            gradient: LColors.shimmerGradient,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: LColors.loading,
            ),
          ),
          errorWidget: (context, url, error) => const FlutterLogo(),
        ),
      ),
    );
  }
}
