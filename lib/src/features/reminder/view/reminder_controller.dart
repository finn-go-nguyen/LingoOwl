import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../data/reminder_repository.dart';
import '../model/reminder.dart';

final reminderControllerProvider =
    StateNotifierProvider<ReminderController, List<LReminder>>((ref) {
  final reminderRepository =
      ref.watch(DomainManager.instance.reminderRepositoryProvider);
  return ReminderController(reminderRepository);
});

class ReminderController extends StateNotifier<List<LReminder>> {
  ReminderController(
    this.reminderRepository,
  ) : super(const <LReminder>[]) {
    _init();
  }

  final ReminderRepository reminderRepository;

  void _init() async {
    final remindersValue =
        await AsyncValue.guard(() => reminderRepository.fetchReminders());

    if (remindersValue.hasError) return;
    state = remindersValue.value!;
  }

  void onNewReminderConfirmButtonPressed(LReminder reminder) async {
    if (_isExist(reminder.time)) return;

    _updateReminders([...state, reminder]);
  }

  void onDeleteButtonPressed(ReminderId id) async {
    final update = List<LReminder>.from(state)
      ..removeWhere((element) => element.id == id);
    _updateReminders(update);
  }

  bool _isExist(TimeOfDay time) {
    try {
      state.firstWhere((element) => element.time == time);
      return true;
    } on StateError {
      return false;
    }
  }

  void _updateReminders(List<LReminder> update) async {
    final asyncValue =
        await AsyncValue.guard(() => reminderRepository.setReminders(update));
    if (asyncValue.hasError) return;

    state = update;
  }
}
