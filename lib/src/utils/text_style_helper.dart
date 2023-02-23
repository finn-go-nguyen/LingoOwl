import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textStyleHelperProvider =
    Provider.family<TextStyleHelpers, BuildContext>((ref, context) {
  return TextStyleHelpers(context);
});

class TextStyleHelpers {
  const TextStyleHelpers(this.context);
  final BuildContext context;

  TextStyle? get description => Theme.of(context)
      .textTheme
      .bodyLarge
      ?.copyWith(color: Theme.of(context).colorScheme.outline);

  TextStyle? get majorPriceMedium =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          );

  TextStyle? get majorPriceLarge =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          );

  TextStyle? get lineThroughPriceMedium =>
      Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.outlineVariant,
            decoration: TextDecoration.lineThrough,
          );

  TextStyle? get lineThroughPriceLarge =>
      Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.outlineVariant,
            decoration: TextDecoration.lineThrough,
            fontSize: 30.0,
          );

  TextStyle? get courseNameLarge =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          );

  TextStyle? get courseNameMedium =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          );

  TextStyle? get ratingValue =>
      Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          );

  TextStyle? get courseRating =>
      Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          );

  TextStyle? get reviewerName =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          );

  TextStyle? get studentFeedback =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          );
}
