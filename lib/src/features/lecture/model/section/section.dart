import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/type_defs/type_defs.dart';

part 'section.freezed.dart';
part 'section.g.dart';

@freezed
class LSection with _$LSection {
  const factory LSection({
    required Index index,
    required String name,
  }) = _LSection;

  factory LSection.fromJson(Map<String, Object?> json) =>
      _$LSectionFromJson(json);
}
