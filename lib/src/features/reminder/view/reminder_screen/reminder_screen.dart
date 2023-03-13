import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../widgets/common/common.dart';
import '../../data/reminder_repository_impl.dart';
import 'time_and_reminders_dialog.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: const LAppBar(title: 'Learning reminders'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: UiParameters.screenPadding,
              child: Text(
                'Set a learning reminder to help you meet your goals faster. You '
                'can change the frequency or turn them off in your account '
                'settings at any time.',
                textAlign: TextAlign.justify,
              ),
            ),
            _buildLearningReminderTile(),
            Gaps.divider,
            _buildTimeAndRemindersTile(),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningReminderTile() {
    // TODO: Get data from settings provider
    return SwitchListTile.adaptive(
      value: true,
      onChanged: (_) {},
      title: const Text(
        'Learning reminders',
      ),
    );
  }

  Widget _buildTimeAndRemindersTile() {
    return Builder(builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          // TODO: Get data from settings provider
          const isReminderEnabled = true;
          return ListTile(
            enabled: isReminderEnabled,
            onTap: () => showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) => const TimeAndRemindersDialog(),
            ),
            title: const Text(
              'Time and reminders',
            ),
            trailing: child!,
          );
        },
        child: _buildTimeAndRemindersTrailing(),
      );
    });
  }

  Widget _buildTimeAndRemindersTrailing() {
    return Builder(builder: (context) {
      return Container(
        height: Sizes.p36,
        width: Sizes.p36,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Consumer(builder: (context, ref, child) {
            final remindersCount = ref.watch(reminderCountProvider);
            return Text(
              remindersCount.toString(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            );
          }),
        ),
      );
    });
  }
}
