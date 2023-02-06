import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final currencyFormatterProvider = Provider.autoDispose<NumberFormat>((ref) {
  return NumberFormat.simpleCurrency(locale: 'en_US');
});

final dateTimeFormatterProvider = Provider.autoDispose<DateFormat>((ref) {
  return DateFormat('M/d/yyyy, hh:mm a');
});

final compactNumberFormatterProvider =
    Provider.autoDispose<NumberFormat>((ref) {
  return NumberFormat.compact();
});
