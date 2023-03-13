import 'dart:convert';

import '../../../constants/firestore/collection_name.dart';
import '../../../utils/local_collection_reference.dart';
import '../model/reminder.dart';

class ReminderCollectionReference
    extends LocalCollectionReference<List<LReminder>> {
  ReminderCollectionReference()
      : super(
          CollectionName.reminder,
          toJson: (reminders) =>
              jsonEncode(reminders.map((e) => e.toJson()).toList()),
          fromJson: (jsonString) {
            final list = jsonDecode(jsonString) as List;
            return list.map((e) => LReminder.fromJson(e)).toList();
          },
        );
}
