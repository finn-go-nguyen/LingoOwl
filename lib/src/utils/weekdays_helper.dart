import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'formatter.dart';

final shortWeekdaysMapProvider = Provider<Map<int, String>>((ref) {
  final dateTimeFormatter = ref.watch(dateTimeFormatterProvider);

  final shortWeekdays = dateTimeFormatter.dateSymbols.SHORTWEEKDAYS;
  final weekdaysMap = Map<int, String>.fromIterables(
      List.generate(shortWeekdays.length, (index) => index), shortWeekdays);
  return weekdaysMap;
});
