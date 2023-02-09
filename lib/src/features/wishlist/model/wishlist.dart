import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';

part 'wishlist.freezed.dart';
part 'wishlist.g.dart';

@freezed
class LWishList with _$LWishList {
  const LWishList._();
  const factory LWishList({
    /// Key: courseId, value: timeStamp in milliseconds
    @Default(<CourseId, TimeStamp>{}) Map<CourseId, TimeStamp> courses,
  }) = _LWishList;

  factory LWishList.empty() => const LWishList();

  factory LWishList.fromJson(Map<String, Object?> json) =>
      _$LWishListFromJson(json);
}
