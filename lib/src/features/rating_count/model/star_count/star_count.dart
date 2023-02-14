import 'package:freezed_annotation/freezed_annotation.dart';

import '../star/star.dart';

part 'star_count.freezed.dart';

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

  factory LStarCount.fromDocument(Map<String, Object?> json) => LStarCount(
        stars: <int, LStar>{
          5: LStar.five(json['5'] as int),
          4: LStar.four(json['4'] as int),
          3: LStar.three(json['3'] as int),
          2: LStar.two(json['2'] as int),
          1: LStar.one(json['1'] as int),
        },
      );

  Map<String, Object?> toDocument() => throw UnimplementedError();
}
