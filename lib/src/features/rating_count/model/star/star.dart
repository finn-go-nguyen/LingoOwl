import 'package:freezed_annotation/freezed_annotation.dart';

part 'star.freezed.dart';

@freezed
class LStar with _$LStar {
  const LStar._();
  const factory LStar.one(int count) = _One;
  const factory LStar.two(int count) = _Two;
  const factory LStar.three(int count) = _Three;
  const factory LStar.four(int count) = _Four;
  const factory LStar.five(int count) = _Five;

  LStar increment() => copyWith(count: count + 1);

  int get value => when(
        one: (_) => 1,
        two: (_) => 2,
        three: (_) => 3,
        four: (_) => 4,
        five: (_) => 5,
      );
}
