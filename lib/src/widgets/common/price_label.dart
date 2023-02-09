import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_parameters/app_parameters.dart';
import '../../utils/currency_formatter.dart';
import '../../utils/text_style_helper.dart';

class PriceLabel extends ConsumerWidget {
  const PriceLabel({
    super.key,
    required this.price,
    required this.salePrice,
    this.isLargeText = false,
  });

  final double price;
  final double? salePrice;
  final bool isLargeText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelper = ref.watch(textStyleHelperProvider(context));
    return salePrice == null
        ? Text(
            ref.read(currencyFormatterProvider).format(
                  price,
                ),
            style: isLargeText
                ? textStyleHelper.majorPriceLarge
                : textStyleHelper.majorPriceMedium,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ref.read(currencyFormatterProvider).format(salePrice),
                style: isLargeText
                    ? textStyleHelper.majorPriceLarge
                    : textStyleHelper.majorPriceMedium,
              ),
              Gaps.w8,
              Text(
                ref.read(currencyFormatterProvider).format(price),
                style: isLargeText
                    ? textStyleHelper.lineThroughPriceLarge
                    : textStyleHelper.lineThroughPriceMedium,
              )
            ],
          );
  }
}
