import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/coordinator.dart';
import '../reminder_controller.dart';
import '../time_and_reminders_view/new_reminder_dialog.dart';
import 'reminder_list_tile.dart';

class TimeAndRemindersDialog extends StatelessWidget {
  const TimeAndRemindersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gaps.h12,
          const Text('Time and reminders'),
          Gaps.h12,
          Gaps.divider,
          _buildReminderList(),
          Gaps.divider,
          Gaps.h12,
          _buildBottomButtons(),
          Gaps.h12,
        ],
      ),
    );
  }

  Widget _buildReminderList() {
    return Consumer(
      builder: (context, ref, child) {
        final reminders = ref.watch(
            reminderControllerProvider.select((value) => value.reminders));
        if (reminders.isEmpty) {
          return Column(
            children: [
              Gaps.h12,
              FaIcon(
                FontAwesomeIcons.solidBell,
                color: Theme.of(context).colorScheme.secondary,
                size: Sizes.p64,
              ),
              Gaps.h12,
              const Text('No reminders for this activity'),
              Gaps.h12,
            ],
          );
        } else {
          return ConstrainedBox(
            constraints: BoxConstraints.loose(
              Size.fromHeight(MediaQuery.of(context).size.height * .3),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final reminder = reminders[index];
                return ReminderListTile(
                  onTap: (reminder) {
                    showDialog(
                      context: context,
                      builder: (context) => ReminderDialog(reminder: reminder),
                    );
                  },
                  onDeleteButtonPressed: () {},
                  reminder: reminder,
                );
              },
              separatorBuilder: (_, __) => Gaps.divider,
            ),
          );
        }
      },
    );
  }

  Widget _buildBottomButtons() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const TextButton(
            onPressed: LCoordinator.onBack,
            child: Text('Close'),
          ),
          Gaps.w8,
          FilledButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const ReminderDialog(),
              );
            },
            icon: const Icon(Icons.add_circle_outline),
            label: const Text('New reminder'),
          ),
          Gaps.w16,
        ],
      );
    });
  }
}
