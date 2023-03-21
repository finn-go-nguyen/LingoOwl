// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LQuestion _$LQuestionFromJson(Map<String, dynamic> json) {
  return _LQuestion.fromJson(json);
}

/// @nodoc
mixin _$LQuestion {
  String get content => throw _privateConstructorUsedError;
  QuestionType get type => throw _privateConstructorUsedError;
  List<String> get choices => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LQuestionCopyWith<LQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LQuestionCopyWith<$Res> {
  factory $LQuestionCopyWith(LQuestion value, $Res Function(LQuestion) then) =
      _$LQuestionCopyWithImpl<$Res, LQuestion>;
  @useResult
  $Res call(
      {String content,
      QuestionType type,
      List<String> choices,
      List<String> answers,
      String? explanation});
}

/// @nodoc
class _$LQuestionCopyWithImpl<$Res, $Val extends LQuestion>
    implements $LQuestionCopyWith<$Res> {
  _$LQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? type = null,
    Object? choices = null,
    Object? answers = null,
    Object? explanation = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LQuestionCopyWith<$Res> implements $LQuestionCopyWith<$Res> {
  factory _$$_LQuestionCopyWith(
          _$_LQuestion value, $Res Function(_$_LQuestion) then) =
      __$$_LQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      QuestionType type,
      List<String> choices,
      List<String> answers,
      String? explanation});
}

/// @nodoc
class __$$_LQuestionCopyWithImpl<$Res>
    extends _$LQuestionCopyWithImpl<$Res, _$_LQuestion>
    implements _$$_LQuestionCopyWith<$Res> {
  __$$_LQuestionCopyWithImpl(
      _$_LQuestion _value, $Res Function(_$_LQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? type = null,
    Object? choices = null,
    Object? answers = null,
    Object? explanation = freezed,
  }) {
    return _then(_$_LQuestion(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LQuestion implements _LQuestion {
  const _$_LQuestion(
      {required this.content,
      required this.type,
      required final List<String> choices,
      required final List<String> answers,
      this.explanation})
      : _choices = choices,
        _answers = answers;

  factory _$_LQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_LQuestionFromJson(json);

  @override
  final String content;
  @override
  final QuestionType type;
  final List<String> _choices;
  @override
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final String? explanation;

  @override
  String toString() {
    return 'LQuestion(content: $content, type: $type, choices: $choices, answers: $answers, explanation: $explanation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LQuestion &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      type,
      const DeepCollectionEquality().hash(_choices),
      const DeepCollectionEquality().hash(_answers),
      explanation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LQuestionCopyWith<_$_LQuestion> get copyWith =>
      __$$_LQuestionCopyWithImpl<_$_LQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LQuestionToJson(
      this,
    );
  }
}

abstract class _LQuestion implements LQuestion {
  const factory _LQuestion(
      {required final String content,
      required final QuestionType type,
      required final List<String> choices,
      required final List<String> answers,
      final String? explanation}) = _$_LQuestion;

  factory _LQuestion.fromJson(Map<String, dynamic> json) =
      _$_LQuestion.fromJson;

  @override
  String get content;
  @override
  QuestionType get type;
  @override
  List<String> get choices;
  @override
  List<String> get answers;
  @override
  String? get explanation;
  @override
  @JsonKey(ignore: true)
  _$$_LQuestionCopyWith<_$_LQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
