import 'package:freezed_annotation/freezed_annotation.dart';

import '../../course/model/course.dart';

part 'search_view_state.freezed.dart';

@freezed
class SearchViewState with _$SearchViewState {
  const factory SearchViewState({
    @Default('') String oldQuery,
    @Default(<LCourse>[]) List<LCourse> courses,
  }) = _SearchViewState;
}
