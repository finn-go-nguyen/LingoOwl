import 'package:freezed_annotation/freezed_annotation.dart';

import '../star/star.dart';

part 'star_count.freezed.dart';
part 'star_count.g.dart';

@freezed
class LStarCount with _$LStarCount {
  const LStarCount._();
  const factory LStarCount({
    @Default(
      <int, LStar>{
        5: LStar.five(0),
        4: LStar.four(0),
        3: LStar.three(0),
        2: LStar.two(0),
        1: LStar.one(0),
      },
    )
        Map<int, LStar> stars,
  }) = _LStarCount;

  int get total => stars.entries
      .fold(0, (previousValue, element) => previousValue + element.value.count);

  LStarCount increment(int star) {
    final copy = Map<int, LStar>.from(stars);
    copy.update(
      star,
      (value) => value.increment(),
    );
    return LStarCount(stars: copy);
  }

  double get average {
    if (total == 0) return 0.0;

    final sum = stars.entries.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element.key * element.value.count));
    return sum / total;
  }

  factory LStarCount.fromJson(Map<String, Object?> json) =>
      _$LStarCountFromJson(json);
}
