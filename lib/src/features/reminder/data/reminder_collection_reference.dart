import 'dart:convert';

import 'package:online_course_app/src/constants/firestore/collection_name.dart';
import 'package:online_course_app/src/features/reminder/model/reminder.dart';

import '../../../utils/local_collection_reference.dart';

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
