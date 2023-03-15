import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/app_parameters/app_parameters.dart';
import 'loading/loading.dart';

class ReminderListEmpty extends StatelessWidget {
  const ReminderListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}

class ReminderListLoading extends StatelessWidget {
  const ReminderListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingState();
  }
}
