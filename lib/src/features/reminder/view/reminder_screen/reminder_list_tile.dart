import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/weekdays_helper.dart';
import '../../../../widgets/common/common.dart';
import '../../model/reminder.dart';

class ReminderListTile extends ConsumerWidget {
  const ReminderListTile({
    super.key,
    required this.reminder,
    required this.onTap,
    required this.onDeleteButtonPressed,
  });

  final LReminder reminder;
  final ValueChanged<LReminder> onTap;
  final VoidCallback onDeleteButtonPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekdaysMap = ref.watch(shortWeekdaysMapProvider);

    return ListTile(
      onTap: () => onTap(reminder),
      leading: _buildLeading(),
      title: Center(
        child: Text(
          reminder.time.format(context),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      subtitle: _buildSubtitle(context, weekdaysMap),
      trailing: _buildTrailing(context),
    );
  }

  Widget _buildSubtitle(BuildContext context, Map<int, String> weekdaysMap) {
    late final String content;
    if (reminder.scheduleType.isEveryday) {
      content = reminder.scheduleType.name.capitalize;
    } else {
      final selected = reminder.selectedWeekdays.map((e) => weekdaysMap[e]!);
      content = selected.join('·');
    }

    return Center(
      child: FittedBox(
        child: Text(
          content,
        ),
      ),
    );
  }

  Widget _buildLeading() {
    return CircleIconButton(
      iconData: reminder.reminderType.iconData,
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return CircleIconButton(
      backgroundColor: Theme.of(context).colorScheme.outlineVariant,
      onPressed: onDeleteButtonPressed,
      iconData: Icons.delete_outline,
    );
  }
}
