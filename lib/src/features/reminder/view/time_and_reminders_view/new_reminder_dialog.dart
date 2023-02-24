import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/coordinator.dart';
import '../../model/reminder.dart';
import '../../model/reminder_type.dart';
import '../../model/schedule_type.dart';
import '../reminder_controller.dart';
import '../widgets/weekday_selector.dart';
import 'new_reminder_controller.dart';

class ReminderDialog extends ConsumerWidget {
  const ReminderDialog({
    super.key,
    this.reminder,
  });

  final LReminder? reminder;

  TextStyle? sectionTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gaps.h12,
          Text(
            'New reminder',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Gaps.h12,
          Gaps.divider,
          _buildTimePicker(),
          Gaps.divider,
          _buildReminderTypePicker(),
          Gaps.h12,
          Gaps.divider,
          Gaps.h12,
          _buildReminderSchedulePicker(),
          Gaps.h12,
          _buildBottomButtons(),
          Gaps.h12,
        ],
      ),
    );
  }

  Widget _buildTimePicker() {
    return Builder(builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final time = ref.watch(newReminderControllerProvider(reminder)
              .select((value) => value.time));
          return InkWell(
            onTap: () => ref
                .read(newReminderControllerProvider(reminder).notifier)
                .onReminderTimeChanged(
                  () => showTimePicker(
                    context: context,
                    initialTime: time,
                  ),
                ),
            child: child,
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                Gaps.h12,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p16,
                    vertical: Sizes.p8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: UiParameters.borderRadius,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final time = ref.watch(
                          newReminderControllerProvider(reminder)
                              .select((value) => value.time));
                      return Text(
                        time.format(context),
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleLarge
                            ?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                            ),
                      );
                    },
                  ),
                ),
                Text(
                  'Reminder time',
                  style: sectionTextStyle(context),
                ),
                Gaps.h12,
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildReminderTypePicker() {
    return Builder(builder: (context) {
      return Padding(
        padding: UiParameters.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.h12,
            Text(
              'Reminder type',
              style: sectionTextStyle(context),
            ),
            Gaps.h8,
            SizedBox(
              width: double.infinity,
              child: Consumer(
                builder: (context, ref, child) {
                  final reminderType = ref.watch(
                      newReminderControllerProvider(reminder)
                          .select((value) => value.reminderType));
                  return SegmentedButton(
                    showSelectedIcon: false,
                    segments: ReminderType.values
                        .map(
                          (e) => ButtonSegment<ReminderType>(
                            value: e,
                            icon: Icon(
                              e.iconData,
                              size: Sizes.p24,
                            ),
                            label: Text(
                              e.name.capitalize,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        )
                        .toList(),
                    selected: <ReminderType>{reminderType},
                    onSelectionChanged: (type) => ref
                        .read(newReminderControllerProvider(reminder).notifier)
                        .onReminderTypeChanged(type.first),
                  );
                },
              ),
            ),
            Gaps.h12,
          ],
        ),
      );
    });
  }

  Widget _buildReminderSchedulePicker() {
    return Consumer(
      builder: (context, ref, child) {
        final scheduleType = ref.watch(newReminderControllerProvider(reminder)
            .select((value) => value.scheduleType));

        return Padding(
          padding: UiParameters.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reminder schedule',
                style: sectionTextStyle(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox.square(
                    dimension: 30,
                    child: Radio<ScheduleType>(
                      value: ScheduleType.everyday,
                      groupValue: scheduleType,
                      onChanged: (value) => ref
                          .read(
                              newReminderControllerProvider(reminder).notifier)
                          .onScheduleTypeChanged(value!),
                    ),
                  ),
                  Gaps.w8,
                  const Text('Always enabled'),
                ],
              ),
              Row(
                children: [
                  SizedBox.square(
                    dimension: 30,
                    child: Radio(
                      value: ScheduleType.custom,
                      groupValue: scheduleType,
                      onChanged: (value) => ref
                          .read(
                              newReminderControllerProvider(reminder).notifier)
                          .onScheduleTypeChanged(value!),
                    ),
                  ),
                  Gaps.w8,
                  const Text('Custom'),
                ],
              ),
              Visibility(
                visible: scheduleType.isCustom,
                child: Column(
                  children: [
                    Gaps.h8,
                    Text(
                        'The reminder will only be activated if the activity is '
                        'also scheduled for the day.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall),
                    Gaps.h12,
                    Consumer(
                      builder: (context, ref, child) {
                        final weekdays = ref.watch(
                            newReminderControllerProvider(reminder)
                                .select((value) => value.selectedWeekdays));
                        return WeekdaySelector(
                          onSelectionChanged: ref
                              .read(newReminderControllerProvider(reminder)
                                  .notifier)
                              .onWeekdaysChanged,
                          weekdays: weekdays,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomButtons() {
    return Consumer(builder: (context, ref, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const TextButton(
            onPressed: LCoordinator.onBack,
            child: Text('Cancel'),
          ),
          Gaps.w8,
          FilledButton(
            onPressed: () {
              final reminder =
                  ref.read(newReminderControllerProvider(this.reminder));
              ref
                  .read(reminderControllerProvider.notifier)
                  .onNewReminderConfirmButtonPressed(reminder);
              LCoordinator.onBack();
            },
            child: const Text('Confirm'),
          ),
          Gaps.w16,
        ],
      );
    });
  }
}
