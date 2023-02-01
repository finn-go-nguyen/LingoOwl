import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_parameters/app_parameters.dart';
import '../../themes/colors.dart';
import '../../utils/currency_formarter.dart';

class PriceLabel extends ConsumerWidget {
  const PriceLabel({
    super.key,
    required this.price,
    required this.salePrice,
  });

  final double price;
  final double? salePrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return salePrice == null
        ? Text(
            ref.read(currencyFormatterProvider).format(
                  price,
                ),
            style: Theme.of(context).textTheme.titleLarge,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ref.read(currencyFormatterProvider).format(salePrice),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gaps.w4,
              Text(
                ref.read(currencyFormatterProvider).format(price),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: LColors.strikeThrough,
                      decoration: TextDecoration.lineThrough,
                    ),
              )
            ],
          );
  }
}
