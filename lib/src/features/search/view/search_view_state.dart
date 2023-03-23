import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_view_state.freezed.dart';

@freezed
class SearchViewState with _$SearchViewState {
  const factory SearchViewState({
    @Default('') String oldQuery,
  }) = _SearchViewState;
}
