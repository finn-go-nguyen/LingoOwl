// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LQuiz _$LQuizFromJson(Map<String, dynamic> json) {
  return _LQuiz.fromJson(json);
}

/// @nodoc
mixin _$LQuiz {
  String get id => throw _privateConstructorUsedError;
  List<LQuestion> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LQuizCopyWith<LQuiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LQuizCopyWith<$Res> {
  factory $LQuizCopyWith(LQuiz value, $Res Function(LQuiz) then) =
      _$LQuizCopyWithImpl<$Res, LQuiz>;
  @useResult
  $Res call({String id, List<LQuestion> questions});
}

/// @nodoc
class _$LQuizCopyWithImpl<$Res, $Val extends LQuiz>
    implements $LQuizCopyWith<$Res> {
  _$LQuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<LQuestion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LQuizCopyWith<$Res> implements $LQuizCopyWith<$Res> {
  factory _$$_LQuizCopyWith(_$_LQuiz value, $Res Function(_$_LQuiz) then) =
      __$$_LQuizCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<LQuestion> questions});
}

/// @nodoc
class __$$_LQuizCopyWithImpl<$Res> extends _$LQuizCopyWithImpl<$Res, _$_LQuiz>
    implements _$$_LQuizCopyWith<$Res> {
  __$$_LQuizCopyWithImpl(_$_LQuiz _value, $Res Function(_$_LQuiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questions = null,
  }) {
    return _then(_$_LQuiz(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<LQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LQuiz implements _LQuiz {
  const _$_LQuiz({required this.id, required final List<LQuestion> questions})
      : _questions = questions;

  factory _$_LQuiz.fromJson(Map<String, dynamic> json) =>
      _$$_LQuizFromJson(json);

  @override
  final String id;
  final List<LQuestion> _questions;
  @override
  List<LQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'LQuiz(id: $id, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LQuiz &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LQuizCopyWith<_$_LQuiz> get copyWith =>
      __$$_LQuizCopyWithImpl<_$_LQuiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LQuizToJson(
      this,
    );
  }
}

abstract class _LQuiz implements LQuiz {
  const factory _LQuiz(
      {required final String id,
      required final List<LQuestion> questions}) = _$_LQuiz;

  factory _LQuiz.fromJson(Map<String, dynamic> json) = _$_LQuiz.fromJson;

  @override
  String get id;
  @override
  List<LQuestion> get questions;
  @override
  @JsonKey(ignore: true)
  _$$_LQuizCopyWith<_$_LQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}
