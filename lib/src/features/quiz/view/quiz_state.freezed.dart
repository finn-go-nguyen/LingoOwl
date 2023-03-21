// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizState {
  LQuiz? get quiz => throw _privateConstructorUsedError;
  String? get selected => throw _privateConstructorUsedError;
  Set<String> get checkedAnswers => throw _privateConstructorUsedError;
  int get currentQuestionIndex => throw _privateConstructorUsedError;
  AsyncValue<void> get status => throw _privateConstructorUsedError;
  bool get hasCorrectAnswer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizStateCopyWith<QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res, QuizState>;
  @useResult
  $Res call(
      {LQuiz? quiz,
      String? selected,
      Set<String> checkedAnswers,
      int currentQuestionIndex,
      AsyncValue<void> status,
      bool hasCorrectAnswer});

  $LQuizCopyWith<$Res>? get quiz;
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quiz = freezed,
    Object? selected = freezed,
    Object? checkedAnswers = null,
    Object? currentQuestionIndex = null,
    Object? status = null,
    Object? hasCorrectAnswer = null,
  }) {
    return _then(_value.copyWith(
      quiz: freezed == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as LQuiz?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedAnswers: null == checkedAnswers
          ? _value.checkedAnswers
          : checkedAnswers // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      hasCorrectAnswer: null == hasCorrectAnswer
          ? _value.hasCorrectAnswer
          : hasCorrectAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LQuizCopyWith<$Res>? get quiz {
    if (_value.quiz == null) {
      return null;
    }

    return $LQuizCopyWith<$Res>(_value.quiz!, (value) {
      return _then(_value.copyWith(quiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$$_QuizStateCopyWith(
          _$_QuizState value, $Res Function(_$_QuizState) then) =
      __$$_QuizStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LQuiz? quiz,
      String? selected,
      Set<String> checkedAnswers,
      int currentQuestionIndex,
      AsyncValue<void> status,
      bool hasCorrectAnswer});

  @override
  $LQuizCopyWith<$Res>? get quiz;
}

/// @nodoc
class __$$_QuizStateCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$_QuizState>
    implements _$$_QuizStateCopyWith<$Res> {
  __$$_QuizStateCopyWithImpl(
      _$_QuizState _value, $Res Function(_$_QuizState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quiz = freezed,
    Object? selected = freezed,
    Object? checkedAnswers = null,
    Object? currentQuestionIndex = null,
    Object? status = null,
    Object? hasCorrectAnswer = null,
  }) {
    return _then(_$_QuizState(
      quiz: freezed == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as LQuiz?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedAnswers: null == checkedAnswers
          ? _value._checkedAnswers
          : checkedAnswers // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncValue<void>,
      hasCorrectAnswer: null == hasCorrectAnswer
          ? _value.hasCorrectAnswer
          : hasCorrectAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_QuizState extends _QuizState {
  const _$_QuizState(
      {this.quiz,
      this.selected,
      final Set<String> checkedAnswers = const <String>{},
      this.currentQuestionIndex = 0,
      this.status = const AsyncLoading(),
      this.hasCorrectAnswer = false})
      : _checkedAnswers = checkedAnswers,
        super._();

  @override
  final LQuiz? quiz;
  @override
  final String? selected;
  final Set<String> _checkedAnswers;
  @override
  @JsonKey()
  Set<String> get checkedAnswers {
    if (_checkedAnswers is EqualUnmodifiableSetView) return _checkedAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_checkedAnswers);
  }

  @override
  @JsonKey()
  final int currentQuestionIndex;
  @override
  @JsonKey()
  final AsyncValue<void> status;
  @override
  @JsonKey()
  final bool hasCorrectAnswer;

  @override
  String toString() {
    return 'QuizState(quiz: $quiz, selected: $selected, checkedAnswers: $checkedAnswers, currentQuestionIndex: $currentQuestionIndex, status: $status, hasCorrectAnswer: $hasCorrectAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizState &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality()
                .equals(other._checkedAnswers, _checkedAnswers) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hasCorrectAnswer, hasCorrectAnswer) ||
                other.hasCorrectAnswer == hasCorrectAnswer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      quiz,
      selected,
      const DeepCollectionEquality().hash(_checkedAnswers),
      currentQuestionIndex,
      status,
      hasCorrectAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizStateCopyWith<_$_QuizState> get copyWith =>
      __$$_QuizStateCopyWithImpl<_$_QuizState>(this, _$identity);
}

abstract class _QuizState extends QuizState {
  const factory _QuizState(
      {final LQuiz? quiz,
      final String? selected,
      final Set<String> checkedAnswers,
      final int currentQuestionIndex,
      final AsyncValue<void> status,
      final bool hasCorrectAnswer}) = _$_QuizState;
  const _QuizState._() : super._();

  @override
  LQuiz? get quiz;
  @override
  String? get selected;
  @override
  Set<String> get checkedAnswers;
  @override
  int get currentQuestionIndex;
  @override
  AsyncValue<void> get status;
  @override
  bool get hasCorrectAnswer;
  @override
  @JsonKey(ignore: true)
  _$$_QuizStateCopyWith<_$_QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}
