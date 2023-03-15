import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class LCart with _$LCart {
  const LCart._();
  const factory LCart({
    /// Key: courseId, value: timeStamp in milliseconds
    @Default(<CourseId, TimeStamp>{}) Map<CourseId, TimeStamp> courses,
  }) = _LCart;

  factory LCart.empty() => const LCart();

  factory LCart.fromJson(Map<String, Object?> json) => _$LCartFromJson(json);
}
