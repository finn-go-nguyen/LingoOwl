// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'star.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LStar _$LStarFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'one':
      return _One.fromJson(json);
    case 'two':
      return _Two.fromJson(json);
    case 'three':
      return _Three.fromJson(json);
    case 'four':
      return _Four.fromJson(json);
    case 'five':
      return _Five.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'LStar',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$LStar {
  int get count => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) one,
    required TResult Function(int count) two,
    required TResult Function(int count) three,
    required TResult Function(int count) four,
    required TResult Function(int count) five,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? one,
    TResult? Function(int count)? two,
    TResult? Function(int count)? three,
    TResult? Function(int count)? four,
    TResult? Function(int count)? five,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? one,
    TResult Function(int count)? two,
    TResult Function(int count)? three,
    TResult Function(int count)? four,
    TResult Function(int count)? five,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_One value) one,
    required TResult Function(_Two value) two,
    required TResult Function(_Three value) three,
    required TResult Function(_Four value) four,
    required TResult Function(_Five value) five,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_One value)? one,
    TResult? Function(_Two value)? two,
    TResult? Function(_Three value)? three,
    TResult? Function(_Four value)? four,
    TResult? Function(_Five value)? five,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_One value)? one,
    TResult Function(_Two value)? two,
    TResult Function(_Three value)? three,
    TResult Function(_Four value)? four,
    TResult Function(_Five value)? five,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LStarCopyWith<LStar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LStarCopyWith<$Res> {
  factory $LStarCopyWith(LStar value, $Res Function(LStar) then) =
      _$LStarCopyWithImpl<$Res, LStar>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class _$LStarCopyWithImpl<$Res, $Val extends LStar>
    implements $LStarCopyWith<$Res> {
  _$LStarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OneCopyWith<$Res> implements $LStarCopyWith<$Res> {
  factory _$$_OneCopyWith(_$_One value, $Res Function(_$_One) then) =
      __$$_OneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$_OneCopyWithImpl<$Res> extends _$LStarCopyWithImpl<$Res, _$_One>
    implements _$$_OneCopyWith<$Res> {
  __$$_OneCopyWithImpl(_$_One _value, $Res Function(_$_One) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$_One(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_One extends _One {
  const _$_One(this.count, {final String? $type})
      : $type = $type ?? 'one',
        super._();

  factory _$_One.fromJson(Map<String, dynamic> json) => _$$_OneFromJson(json);

  @override
  final int count;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LStar.one(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_One &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OneCopyWith<_$_One> get copyWith =>
      __$$_OneCopyWithImpl<_$_One>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) one,
    required TResult Function(int count) two,
    required TResult Function(int count) three,
    required TResult Function(int count) four,
    required TResult Function(int count) five,
  }) {
    return one(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? one,
    TResult? Function(int count)? two,
    TResult? Function(int count)? three,
    TResult? Function(int count)? four,
    TResult? Function(int count)? five,
  }) {
    return one?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? one,
    TResult Function(int count)? two,
    TResult Function(int count)? three,
    TResult Function(int count)? four,
    TResult Function(int count)? five,
    required TResult orElse(),
  }) {
    if (one != null) {
      return one(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_One value) one,
    required TResult Function(_Two value) two,
    required TResult Function(_Three value) three,
    required TResult Function(_Four value) four,
    required TResult Function(_Five value) five,
  }) {
    return one(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_One value)? one,
    TResult? Function(_Two value)? two,
    TResult? Function(_Three value)? three,
    TResult? Function(_Four value)? four,
    TResult? Function(_Five value)? five,
  }) {
    return one?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_One value)? one,
    TResult Function(_Two value)? two,
    TResult Function(_Three value)? three,
    TResult Function(_Four value)? four,
    TResult Function(_Five value)? five,
    required TResult orElse(),
  }) {
    if (one != null) {
      return one(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_OneToJson(
      this,
    );
  }
}

abstract class _One extends LStar {
  const factory _One(final int count) = _$_One;
  const _One._() : super._();

  factory _One.fromJson(Map<String, dynamic> json) = _$_One.fromJson;

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_OneCopyWith<_$_One> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TwoCopyWith<$Res> implements $LStarCopyWith<$Res> {
  factory _$$_TwoCopyWith(_$_Two value, $Res Function(_$_Two) then) =
      __$$_TwoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$_TwoCopyWithImpl<$Res> extends _$LStarCopyWithImpl<$Res, _$_Two>
    implements _$$_TwoCopyWith<$Res> {
  __$$_TwoCopyWithImpl(_$_Two _value, $Res Function(_$_Two) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$_Two(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Two extends _Two {
  const _$_Two(this.count, {final String? $type})
      : $type = $type ?? 'two',
        super._();

  factory _$_Two.fromJson(Map<String, dynamic> json) => _$$_TwoFromJson(json);

  @override
  final int count;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LStar.two(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Two &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TwoCopyWith<_$_Two> get copyWith =>
      __$$_TwoCopyWithImpl<_$_Two>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) one,
    required TResult Function(int count) two,
    required TResult Function(int count) three,
    required TResult Function(int count) four,
    required TResult Function(int count) five,
  }) {
    return two(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? one,
    TResult? Function(int count)? two,
    TResult? Function(int count)? three,
    TResult? Function(int count)? four,
    TResult? Function(int count)? five,
  }) {
    return two?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? one,
    TResult Function(int count)? two,
    TResult Function(int count)? three,
    TResult Function(int count)? four,
    TResult Function(int count)? five,
    required TResult orElse(),
  }) {
    if (two != null) {
      return two(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_One value) one,
    required TResult Function(_Two value) two,
    required TResult Function(_Three value) three,
    required TResult Function(_Four value) four,
    required TResult Function(_Five value) five,
  }) {
    return two(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_One value)? one,
    TResult? Function(_Two value)? two,
    TResult? Function(_Three value)? three,
    TResult? Function(_Four value)? four,
    TResult? Function(_Five value)? five,
  }) {
    return two?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_One value)? one,
    TResult Function(_Two value)? two,
    TResult Function(_Three value)? three,
    TResult Function(_Four value)? four,
    TResult Function(_Five value)? five,
    required TResult orElse(),
  }) {
    if (two != null) {
      return two(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TwoToJson(
      this,
    );
  }
}

abstract class _Two extends LStar {
  const factory _Two(final int count) = _$_Two;
  const _Two._() : super._();

  factory _Two.fromJson(Map<String, dynamic> json) = _$_Two.fromJson;

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_TwoCopyWith<_$_Two> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ThreeCopyWith<$Res> implements $LStarCopyWith<$Res> {
  factory _$$_ThreeCopyWith(_$_Three value, $Res Function(_$_Three) then) =
      __$$_ThreeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$_ThreeCopyWithImpl<$Res> extends _$LStarCopyWithImpl<$Res, _$_Three>
    implements _$$_ThreeCopyWith<$Res> {
  __$$_ThreeCopyWithImpl(_$_Three _value, $Res Function(_$_Three) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$_Three(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Three extends _Three {
  const _$_Three(this.count, {final String? $type})
      : $type = $type ?? 'three',
        super._();

  factory _$_Three.fromJson(Map<String, dynamic> json) =>
      _$$_ThreeFromJson(json);

  @override
  final int count;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LStar.three(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Three &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThreeCopyWith<_$_Three> get copyWith =>
      __$$_ThreeCopyWithImpl<_$_Three>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) one,
    required TResult Function(int count) two,
    required TResult Function(int count) three,
    required TResult Function(int count) four,
    required TResult Function(int count) five,
  }) {
    return three(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? one,
    TResult? Function(int count)? two,
    TResult? Function(int count)? three,
    TResult? Function(int count)? four,
    TResult? Function(int count)? five,
  }) {
    return three?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? one,
    TResult Function(int count)? two,
    TResult Function(int count)? three,
    TResult Function(int count)? four,
    TResult Function(int count)? five,
    required TResult orElse(),
  }) {
    if (three != null) {
      return three(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_One value) one,
    required TResult Function(_Two value) two,
    required TResult Function(_Three value) three,
    required TResult Function(_Four value) four,
    required TResult Function(_Five value) five,
  }) {
    return three(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_One value)? one,
    TResult? Function(_Two value)? two,
    TResult? Function(_Three value)? three,
    TResult? Function(_Four value)? four,
    TResult? Function(_Five value)? five,
  }) {
    return three?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_One value)? one,
    TResult Function(_Two value)? two,
    TResult Function(_Three value)? three,
    TResult Function(_Four value)? four,
    TResult Function(_Five value)? five,
    required TResult orElse(),
  }) {
    if (three != null) {
      return three(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThreeToJson(
      this,
    );
  }
}

abstract class _Three extends LStar {
  const factory _Three(final int count) = _$_Three;
  const _Three._() : super._();

  factory _Three.fromJson(Map<String, dynamic> json) = _$_Three.fromJson;

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_ThreeCopyWith<_$_Three> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FourCopyWith<$Res> implements $LStarCopyWith<$Res> {
  factory _$$_FourCopyWith(_$_Four value, $Res Function(_$_Four) then) =
      __$$_FourCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$_FourCopyWithImpl<$Res> extends _$LStarCopyWithImpl<$Res, _$_Four>
    implements _$$_FourCopyWith<$Res> {
  __$$_FourCopyWithImpl(_$_Four _value, $Res Function(_$_Four) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$_Four(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Four extends _Four {
  const _$_Four(this.count, {final String? $type})
      : $type = $type ?? 'four',
        super._();

  factory _$_Four.fromJson(Map<String, dynamic> json) => _$$_FourFromJson(json);

  @override
  final int count;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LStar.four(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Four &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FourCopyWith<_$_Four> get copyWith =>
      __$$_FourCopyWithImpl<_$_Four>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) one,
    required TResult Function(int count) two,
    required TResult Function(int count) three,
    required TResult Function(int count) four,
    required TResult Function(int count) five,
  }) {
    return four(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? one,
    TResult? Function(int count)? two,
    TResult? Function(int count)? three,
    TResult? Function(int count)? four,
    TResult? Function(int count)? five,
  }) {
    return four?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? one,
    TResult Function(int count)? two,
    TResult Function(int count)? three,
    TResult Function(int count)? four,
    TResult Function(int count)? five,
    required TResult orElse(),
  }) {
    if (four != null) {
      return four(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_One value) one,
    required TResult Function(_Two value) two,
    required TResult Function(_Three value) three,
    required TResult Function(_Four value) four,
    required TResult Function(_Five value) five,
  }) {
    return four(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_One value)? one,
    TResult? Function(_Two value)? two,
    TResult? Function(_Three value)? three,
    TResult? Function(_Four value)? four,
    TResult? Function(_Five value)? five,
  }) {
    return four?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_One value)? one,
    TResult Function(_Two value)? two,
    TResult Function(_Three value)? three,
    TResult Function(_Four value)? four,
    TResult Function(_Five value)? five,
    required TResult orElse(),
  }) {
    if (four != null) {
      return four(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FourToJson(
      this,
    );
  }
}

abstract class _Four extends LStar {
  const factory _Four(final int count) = _$_Four;
  const _Four._() : super._();

  factory _Four.fromJson(Map<String, dynamic> json) = _$_Four.fromJson;

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_FourCopyWith<_$_Four> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FiveCopyWith<$Res> implements $LStarCopyWith<$Res> {
  factory _$$_FiveCopyWith(_$_Five value, $Res Function(_$_Five) then) =
      __$$_FiveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$_FiveCopyWithImpl<$Res> extends _$LStarCopyWithImpl<$Res, _$_Five>
    implements _$$_FiveCopyWith<$Res> {
  __$$_FiveCopyWithImpl(_$_Five _value, $Res Function(_$_Five) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$_Five(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Five extends _Five {
  const _$_Five(this.count, {final String? $type})
      : $type = $type ?? 'five',
        super._();

  factory _$_Five.fromJson(Map<String, dynamic> json) => _$$_FiveFromJson(json);

  @override
  final int count;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LStar.five(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Five &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FiveCopyWith<_$_Five> get copyWith =>
      __$$_FiveCopyWithImpl<_$_Five>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int count) one,
    required TResult Function(int count) two,
    required TResult Function(int count) three,
    required TResult Function(int count) four,
    required TResult Function(int count) five,
  }) {
    return five(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int count)? one,
    TResult? Function(int count)? two,
    TResult? Function(int count)? three,
    TResult? Function(int count)? four,
    TResult? Function(int count)? five,
  }) {
    return five?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int count)? one,
    TResult Function(int count)? two,
    TResult Function(int count)? three,
    TResult Function(int count)? four,
    TResult Function(int count)? five,
    required TResult orElse(),
  }) {
    if (five != null) {
      return five(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_One value) one,
    required TResult Function(_Two value) two,
    required TResult Function(_Three value) three,
    required TResult Function(_Four value) four,
    required TResult Function(_Five value) five,
  }) {
    return five(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_One value)? one,
    TResult? Function(_Two value)? two,
    TResult? Function(_Three value)? three,
    TResult? Function(_Four value)? four,
    TResult? Function(_Five value)? five,
  }) {
    return five?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_One value)? one,
    TResult Function(_Two value)? two,
    TResult Function(_Three value)? three,
    TResult Function(_Four value)? four,
    TResult Function(_Five value)? five,
    required TResult orElse(),
  }) {
    if (five != null) {
      return five(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FiveToJson(
      this,
    );
  }
}

abstract class _Five extends LStar {
  const factory _Five(final int count) = _$_Five;
  const _Five._() : super._();

  factory _Five.fromJson(Map<String, dynamic> json) = _$_Five.fromJson;

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_FiveCopyWith<_$_Five> get copyWith => throw _privateConstructorUsedError;
}
