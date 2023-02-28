import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../../utils/weekdays_helper.dart';

class WeekdaySelector extends ConsumerWidget {
  const WeekdaySelector({
    super.key,
    required this.weekdays,
    required this.onSelectionChanged,
  });

  final SelectedWeekdays weekdays;
  final void Function(SelectedWeekdays weekdays) onSelectionChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekdaysMap = ref.watch(shortWeekdaysMapProvider);
    return SegmentedButton<int>(
      onSelectionChanged: onSelectionChanged,
      showSelectedIcon: false,
      multiSelectionEnabled: true,
      segments: weekdaysMap.entries
          .map((e) => ButtonSegment(
                value: e.key,
                label: FittedBox(
                  child: Text(
                    e.value.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ))
          .toList(),
      selected: weekdays,
    );
  }
}
