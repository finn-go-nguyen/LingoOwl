// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchViewState {
  String get oldQuery => throw _privateConstructorUsedError;
  List<LCourse> get courses => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchViewStateCopyWith<SearchViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchViewStateCopyWith<$Res> {
  factory $SearchViewStateCopyWith(
          SearchViewState value, $Res Function(SearchViewState) then) =
      _$SearchViewStateCopyWithImpl<$Res, SearchViewState>;
  @useResult
  $Res call({String oldQuery, List<LCourse> courses});
}

/// @nodoc
class _$SearchViewStateCopyWithImpl<$Res, $Val extends SearchViewState>
    implements $SearchViewStateCopyWith<$Res> {
  _$SearchViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldQuery = null,
    Object? courses = null,
  }) {
    return _then(_value.copyWith(
      oldQuery: null == oldQuery
          ? _value.oldQuery
          : oldQuery // ignore: cast_nullable_to_non_nullable
              as String,
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<LCourse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchViewStateCopyWith<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  factory _$$_SearchViewStateCopyWith(
          _$_SearchViewState value, $Res Function(_$_SearchViewState) then) =
      __$$_SearchViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String oldQuery, List<LCourse> courses});
}

/// @nodoc
class __$$_SearchViewStateCopyWithImpl<$Res>
    extends _$SearchViewStateCopyWithImpl<$Res, _$_SearchViewState>
    implements _$$_SearchViewStateCopyWith<$Res> {
  __$$_SearchViewStateCopyWithImpl(
      _$_SearchViewState _value, $Res Function(_$_SearchViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldQuery = null,
    Object? courses = null,
  }) {
    return _then(_$_SearchViewState(
      oldQuery: null == oldQuery
          ? _value.oldQuery
          : oldQuery // ignore: cast_nullable_to_non_nullable
              as String,
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<LCourse>,
    ));
  }
}

/// @nodoc

class _$_SearchViewState implements _SearchViewState {
  const _$_SearchViewState(
      {this.oldQuery = '', final List<LCourse> courses = const <LCourse>[]})
      : _courses = courses;

  @override
  @JsonKey()
  final String oldQuery;
  final List<LCourse> _courses;
  @override
  @JsonKey()
  List<LCourse> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  String toString() {
    return 'SearchViewState(oldQuery: $oldQuery, courses: $courses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchViewState &&
            (identical(other.oldQuery, oldQuery) ||
                other.oldQuery == oldQuery) &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, oldQuery, const DeepCollectionEquality().hash(_courses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchViewStateCopyWith<_$_SearchViewState> get copyWith =>
      __$$_SearchViewStateCopyWithImpl<_$_SearchViewState>(this, _$identity);
}

abstract class _SearchViewState implements SearchViewState {
  const factory _SearchViewState(
      {final String oldQuery,
      final List<LCourse> courses}) = _$_SearchViewState;

  @override
  String get oldQuery;
  @override
  List<LCourse> get courses;
  @override
  @JsonKey(ignore: true)
  _$$_SearchViewStateCopyWith<_$_SearchViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
