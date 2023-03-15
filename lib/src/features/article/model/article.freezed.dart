// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LArticle _$LArticleFromJson(Map<String, dynamic> json) {
  return _LArticle.fromJson(json);
}

/// @nodoc
mixin _$LArticle {
  String get id => throw _privateConstructorUsedError;
  String get htmlCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LArticleCopyWith<LArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LArticleCopyWith<$Res> {
  factory $LArticleCopyWith(LArticle value, $Res Function(LArticle) then) =
      _$LArticleCopyWithImpl<$Res, LArticle>;
  @useResult
  $Res call({String id, String htmlCode});
}

/// @nodoc
class _$LArticleCopyWithImpl<$Res, $Val extends LArticle>
    implements $LArticleCopyWith<$Res> {
  _$LArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? htmlCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      htmlCode: null == htmlCode
          ? _value.htmlCode
          : htmlCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LArticleCopyWith<$Res> implements $LArticleCopyWith<$Res> {
  factory _$$_LArticleCopyWith(
          _$_LArticle value, $Res Function(_$_LArticle) then) =
      __$$_LArticleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String htmlCode});
}

/// @nodoc
class __$$_LArticleCopyWithImpl<$Res>
    extends _$LArticleCopyWithImpl<$Res, _$_LArticle>
    implements _$$_LArticleCopyWith<$Res> {
  __$$_LArticleCopyWithImpl(
      _$_LArticle _value, $Res Function(_$_LArticle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? htmlCode = null,
  }) {
    return _then(_$_LArticle(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      htmlCode: null == htmlCode
          ? _value.htmlCode
          : htmlCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LArticle implements _LArticle {
  const _$_LArticle({required this.id, required this.htmlCode});

  factory _$_LArticle.fromJson(Map<String, dynamic> json) =>
      _$$_LArticleFromJson(json);

  @override
  final String id;
  @override
  final String htmlCode;

  @override
  String toString() {
    return 'LArticle(id: $id, htmlCode: $htmlCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LArticle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.htmlCode, htmlCode) ||
                other.htmlCode == htmlCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, htmlCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LArticleCopyWith<_$_LArticle> get copyWith =>
      __$$_LArticleCopyWithImpl<_$_LArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LArticleToJson(
      this,
    );
  }
}

abstract class _LArticle implements LArticle {
  const factory _LArticle(
      {required final String id, required final String htmlCode}) = _$_LArticle;

  factory _LArticle.fromJson(Map<String, dynamic> json) = _$_LArticle.fromJson;

  @override
  String get id;
  @override
  String get htmlCode;
  @override
  @JsonKey(ignore: true)
  _$$_LArticleCopyWith<_$_LArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
