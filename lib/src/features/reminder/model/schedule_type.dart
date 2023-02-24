enum ScheduleType {
  everyday,
  custom;

  bool get isEveryday => this == ScheduleType.everyday;
  bool get isCustom => this == ScheduleType.custom;
}
